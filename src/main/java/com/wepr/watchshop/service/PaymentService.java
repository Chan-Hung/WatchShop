package com.wepr.watchshop.service;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.wepr.watchshop.model.Order;

import java.util.ArrayList;
import java.util.List;

public class PaymentService {
    private static final String CLIENT_ID = System.getenv("CLIENT_ID");
    private static final String CLIENT_SECRET = System.getenv("CLIENT_SECRET");
    private static final String MODE = "sandbox";

    public String authorizePayment(Order order)
            throws PayPalRESTException {

        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(order);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        return getApprovalLink(approvedPayment);
    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Hưng")
                .setLastName("Đoàn")
                .setEmail("sb-ntbjm22229041@personal.example.com");

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/watchshop_war_exploded/");
        redirectUrls.setReturnUrl(System.getenv("REVIEW_PAGE"));

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(Order order) {
        Details details = new Details();

        //All PayPal properties required String type
        Integer shippingFeeUSD = convertToUSD(order.getShippingFee());
        details.setShipping(shippingFeeUSD.toString());

        long subtotalUSD = 0L;
        for(com.wepr.watchshop.model.Item item: order.getItems())
            subtotalUSD += (long) convertToUSD(item.getProduct().getPrice()) * item.getQuantity();
        details.setSubtotal(Long.toString(subtotalUSD));

        Amount amount = new Amount();
        amount.setCurrency("USD");

        Long amountTotal = shippingFeeUSD + subtotalUSD;
        amount.setTotal(amountTotal.toString());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("Hóa đơn mua hàng tại Watchshop");

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        for(com.wepr.watchshop.model.Item itemWatchshop: order.getItems()){
            Item item = new Item();
            item.setCurrency("USD");
            item.setName(itemWatchshop.getProduct().getName());
            item.setPrice(convertToUSD(itemWatchshop.getProduct().getPrice()).toString());
            item.setQuantity(itemWatchshop.getQuantity().toString());
            items.add(item);
            itemList.setItems(items);
        }
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }
        return approvalLink;
    }

    private Integer convertToUSD(Long amount){
        //Exchange rate from USD  to VND: 1 USD = 24837 VND (21/11/2022)
        Long convertCurrency = amount / 24837;
        return Math.toIntExact(convertCurrency);
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }
}