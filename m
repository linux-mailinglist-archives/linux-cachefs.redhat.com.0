Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E60564BD6
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Jul 2022 04:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656902447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iYbr5xkkUH7hgGSO2nt34pnPmuvw8BA7PkmM4mFZW3Q=;
	b=eAzp8bgQ70VnJhDWg1mtb5xwJ4u5BkUSLqd8LhMRZJEF0uqY0Ju0t2VCrM6rkOUWBCLFRU
	jY2gBwNrIHOH9joTV6zzkda3ULaraq8d7cYgk5WrSylylNbTed7UyWnz71V1Tu2MfM0mH9
	cgcZeCFLxLv7SCVZdA+NH92XY9XrsUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-s3CDcxNiPayDEbQPoxjYBQ-1; Sun, 03 Jul 2022 22:40:44 -0400
X-MC-Unique: s3CDcxNiPayDEbQPoxjYBQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B75083397F;
	Mon,  4 Jul 2022 02:40:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE6140336E;
	Mon,  4 Jul 2022 02:40:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DE8C194704D;
	Mon,  4 Jul 2022 02:40:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0434F1947041 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  4 Jul 2022 02:40:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9E5A2166B29; Mon,  4 Jul 2022 02:40:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D60962166B26
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 02:40:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B89D3101A586
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 02:40:41 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-PmKrKnQeMam9DJQfO_IsXQ-1; Sun, 03 Jul 2022 22:40:40 -0400
X-MC-Unique: PmKrKnQeMam9DJQfO_IsXQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 h18-20020a170902f55200b0016a4a78bd71so4344128plf.9
 for <linux-cachefs@redhat.com>; Sun, 03 Jul 2022 19:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ICsT2ARw4a+JolXjcr8B3H69Dp/Dpn/qLY7Zn9Do1Ck=;
 b=wi/Th4hP9I38IOonZrarcNgQL14zDDFb2MXGd4sjxdntnvBxfzvNnaM3ORXYekjsxe
 WBH9f1LrR1irO/ja7r3AKCzkA+Fv2UkqXd14RJR18Kw8nWvUP9lsI/m20NzG+hHSSWTu
 9QopLw9ISeRn0w4EnVn6HHBxKk3KabotdCZ2SXMXESYQYjJoktVz1wFr7sEJn9vQDWX5
 IzHgeKliqXeR8BvKYn9om4fy4cWLHHmFz1yAjbKv57404qEFgAZm9xMVX2nJLFd/esco
 HeiF0HLDl6jPH+jBHtX4fPD50tn3nUumJ8A45iQoKpFxwtUa6i0lcE8Fzh3Wu90XzTOB
 D08w==
X-Gm-Message-State: AJIora+XDhcGY/af0edQ7JYXVFdmSaWLvIandJahU9Odqz2XnQnNoOxJ
 1TbRoh+zgLAR4xAsAwWvHrpzLORbj9PlglWABYaKYzIoxp6u4+QRSpG485qq24E57cRDsQ8HjAH
 9FEHI03ei1KEaJFH6+fWZE5YjszAU95ia72UkFsI0NjtbpMcpLwskMAee9Xwle4Lu2RQjezE=
X-Received: by 2002:a63:f413:0:b0:40d:ba87:53f8 with SMTP id
 g19-20020a63f413000000b0040dba8753f8mr23612256pgi.193.1656902439319; 
 Sun, 03 Jul 2022 19:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6rQkQeAwxUPjvO4+/sON3E+ea4EU41n3iq0miNQNN+iS3edOR6v+wqUvMCSwrHEf4YPlg2g==
X-Received: by 2002:a63:f413:0:b0:40d:ba87:53f8 with SMTP id
 g19-20020a63f413000000b0040dba8753f8mr23612229pgi.193.1656902438974; 
 Sun, 03 Jul 2022 19:40:38 -0700 (PDT)
Received: from [10.72.12.186] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 lx13-20020a17090b4b0d00b001df264610c4sm13631393pjb.0.2022.07.03.19.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 19:40:38 -0700 (PDT)
To: Matthew Wilcox <willy@infradead.org>
References: <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
 <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
 <f55d10f8-55f6-f56c-bb41-bce139869c8d@redhat.com>
 <YsJMCZB/ecQQha+/@casper.infradead.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <5f9c75f0-d0ae-a9ff-df1b-40dd164d74ca@redhat.com>
Date: Mon, 4 Jul 2022 10:40:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YsJMCZB/ecQQha+/@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: keescook@chromium.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org, idryomov@gmail.com,
 vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

Ck9uIDcvNC8yMiAxMDoxMCBBTSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gTW9uLCBKdWwg
MDQsIDIwMjIgYXQgMDk6MTM6NDRBTSArMDgwMCwgWGl1Ym8gTGkgd3JvdGU6Cj4+IE9uIDcvMS8y
MiA2OjM4IFBNLCBKZWZmIExheXRvbiB3cm90ZToKPj4+IEkgZG9uJ3Qga25vdyBoZXJlLi4uIEkg
dGhpbmsgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIGp1c3QgZXhwZWN0IHRoYXQgd2hlbgo+Pj4gdGhp
cyBmdW5jdGlvbiByZXR1cm5zIGFuIGVycm9yIHRoYXQgdGhlIGZvbGlvIGhhcyBhbHJlYWR5IGJl
ZW4gdW5sb2NrZWQuCj4+PiBEb2luZyBpdCB0aGlzIHdheSB3aWxsIG1lYW4gdGhhdCB5b3Ugd2ls
bCBsb2NrIGFuZCB1bmxvY2sgdGhlIGZvbGlvIGEKPj4+IHNlY29uZCB0aW1lIGZvciBubyByZWFz
b24uCj4+Pgo+Pj4gTWF5YmUgc29tZXRoaW5nIGxpa2UgdGhpcyBpbnN0ZWFkPwo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9mcy9uZXRmcy9idWZmZXJlZF9yZWFkLmMgYi9mcy9uZXRmcy9idWZmZXJlZF9y
ZWFkLmMKPj4+IGluZGV4IDQyZjg5MmM1NzEyZS4uOGFlN2IwZjRjOTA5IDEwMDY0NAo+Pj4gLS0t
IGEvZnMvbmV0ZnMvYnVmZmVyZWRfcmVhZC5jCj4+PiArKysgYi9mcy9uZXRmcy9idWZmZXJlZF9y
ZWFkLmMKPj4+IEBAIC0zNTMsNyArMzUzLDcgQEAgaW50IG5ldGZzX3dyaXRlX2JlZ2luKHN0cnVj
dCBuZXRmc19pbm9kZSAqY3R4LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICB0cmFjZV9u
ZXRmc19mYWlsdXJlKE5VTEwsIE5VTEwsIHJldCwgbmV0ZnNfZmFpbF9jaGVja193cml0ZV9iZWdp
bik7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPT0gLUVBR0FJTikKPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJldHJ5Owo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBlcnJvcjsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gZXJyb3JfdW5sb2NrZWQ7Cj4+PiAgICAgICAgICAgICAgICAgICB9Cj4+PiAgICAgICAg
ICAgfQo+Pj4gQEAgLTQxOCw2ICs0MTgsNyBAQCBpbnQgbmV0ZnNfd3JpdGVfYmVnaW4oc3RydWN0
IG5ldGZzX2lub2RlICpjdHgsCj4+PiAgICBlcnJvcjoKPj4+ICAgICAgICAgICBmb2xpb191bmxv
Y2soZm9saW8pOwo+Pj4gICAgICAgICAgIGZvbGlvX3B1dChmb2xpbyk7Cj4+PiArZXJyb3JfdW5s
b2NrZWQ6Cj4+PiAgICAgICAgICAgX2xlYXZlKCIgPSAlZCIsIHJldCk7Cj4+PiAgICAgICAgICAg
cmV0dXJuIHJldDsKPj4+ICAgIH0KPj4gVGhlbiB0aGUgImFmcyIgd29uJ3Qgd29yayBjb3JyZWN0
bHk6Cj4+Cj4+IDM3NyBzdGF0aWMgaW50IGFmc19jaGVja193cml0ZV9iZWdpbihzdHJ1Y3QgZmls
ZSAqZmlsZSwgbG9mZl90IHBvcywgdW5zaWduZWQKPj4gbGVuLAo+PiAzNzjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGZvbGlvICpmb2xpbywgdm9pZCAqKl9mc2RhdGEpCj4+IDM3OSB7Cj4+IDM4MMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGFmc192bm9kZSAqdm5vZGUgPSBBRlNfRlNfSShmaWxlX2lub2RlKGZp
bGUpKTsKPj4gMzgxCj4+IDM4MsKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRlc3RfYml0KEFGU19W
Tk9ERV9ERUxFVEVELCAmdm5vZGUtPmZsYWdzKSA/IC1FU1RBTEUgOiAwOwo+PiAzODMgfQo+Pgo+
PiBUaGUgImFmcyIgZG9lcyBub3RoaW5nIHdpdGggdGhlIGZvbGlvIGxvY2suCj4gSXQncyBPSyB0
byBmaXggQUZTIHRvby4KPgpPa2F5LCB3aWxsIGZpeCBpdC4gVGhhbmtzIQoKLS0gWGl1Ym8KCgot
LQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

