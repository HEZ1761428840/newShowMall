package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101300679461";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCY/ubVE8qDNb5hFI68lkLUQoBNueHlGjatMljdPzTy6+hmiJWEYKGOiHYPzj/v7FCFDBq1+UtRHQhCp1571KoiR0Hk5OVCkN4wnaz+0lI9Z2qwbO6Ju7aBJrwEbDDnfALXViRW7judr18YCigAI8jjr7W4YwvQPDCIk5lIZsa4DhkQmooGZqzryfU77N91hUv69L9xo6ytMY9EwFGV3+GzKqDfm8Fn/lRAYMqh6XGEDNEqWa18sVEZacaFrmeIKbE+WtH9hLHvZz1ETe/l4gMEPf5RK5rR4mySZVI99lCXW+HyF3mHzwXGNrflCPsnzLjDr+zVcRNXh44vQ3RSHQM5AgMBAAECggEAazKWzA8c4shiRyUfSbXCx3R873jhdSPj0YCoUQT7dYWjhUwH7wPBztuAVVy+4b1jQYWUpZIxmnjME9+vTPZZ6sCgw985X2WfuNKRps34v3tZfpoknK7Alkdsj3C650a1uulpdttfPAHnkDF1i3uHQzkXC0Wivlmd6+P3D4qri8OB2nr9Ela2ehlKB0Jpxux0pnWnMhb7Ab8JRtiPf/SfozrqJBV6Go2b8WPvD9pLdEc14hPvnU4xnXKpnv2A9v7laEfOROasEHztrN6seaqIhpUNNLwVEVzIMcr+XzqJBgLPYwqAl0afnuC4v+MkU8N2KLZlmf01aIatyq2f6ELFnQKBgQDywtLS7fg/NlyBCy9Yw4evmc8EQBHrdxb/ifkMoHV/CqyAf4s3qfdm9h9QW1ONX+G0rBqYH8DtWyrU9FaiefhVTCFPtiSUyJRXTfhGOXzix9gwRP04u+2Bta0xxifvxMGpv+5Jgoczlyy1AXLE2ZES19JMr0a9BICicdU7+YYqOwKBgQChVt5KgMqoSWEN5YfZeiIS7tzyDD5XLPuWH/R8jjtt2/bBygrlI6USNqkDwG51Djc93oiqGoZTNafuqkM3ADNDefQHnlinmHiPPPZ5BKiu4Mvw0I9mp6IY4YHUpXMRoy0xIhmOpwn6TfH33o2Y9kEq9/RysZTRceJlpESh9cu9GwKBgDgU0edwmjzgLhaRoup6oUnr2ms88ebXqDR4h1RnbT1gFeHJlTvSxBjBGxLRRkgOsnGuoKYsD8HFoet4VttKGhh6ceecSG8mtz5EAOsYNMWfLU5ZYbZNk9y3P7+T6330kljIwh+xS9KbRfS61Oys5lrYCPk2NL1N4PmmGoC0cE4pAoGACrk/ZSxSTAU0kjvjX60ifqepv9zYd+rhfgT5tx2tDYxFRnQrbTeFTUScz0cHEHi1a0NTShshOn6iftaKSSmWPrHoamk380vLF5oxt7F7lMQUShlSrrwNpiG3A29LyqxR4KYnlLe9jgmIP7VnK/eSNUztzoHHJnSvW5ojhbBUrmkCgYEA5iLDn7rDxbityZrwWw4eNqvhSed9l4pshIR4g3nK8k7YrVlCk8rVG2fmp2o/WNYxyvaaMak8PuELNVEy8qYI7f3FXnlU8Xn0rJNSkOb0B402IoJfeaFIjJ5paFsjrbdrYyUSmHK64JJLTmhNg+zQBmWNd54lCMSCNDwxK7pYTA0=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs9R9FpLfW4rVKt+fman9wvr6YreSCo9m/lxyVK8T6oJVPrgtueeqXqrN2ZNVRpAplCXhZHJhJC221SUM6qSpRZf3hQrmCExVwSfyaCnXHkTn+n5gyCyQQwhcRUkzqGr1EB2Y9x4HoOYCc4cA2eHArIvBG+F711CEr91DxS4Ft2whEcvOR7xKM5PYv+eHrcbGefTjfHT1lk/yLIqHJJdcbSZGu+dzdct/+6+y6MbsKpskjGQZEoqBGZGMRSkA4smYXRcWwtnmUgvodg4pVefD1Ao96EwMBkjnPPr9GP9Y2cGjsMBVC0WYIq1eMxFZDGMij8aPEf4D3+wTWMGiEV+llQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8//pay/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String return_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8//pay/return_url.jsp";
	public static String return_url = "http://localhost:8080/index";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "E:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

