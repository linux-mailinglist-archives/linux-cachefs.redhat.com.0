Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5F5F8A75
	for <lists+linux-cachefs@lfdr.de>; Sun,  9 Oct 2022 11:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665309165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DAvaT/Fp4FQT+yV0jLagn2XMcsaLrVEWyAWaGCIVypA=;
	b=jHOtbrZjcKS0h5hruJkDAU087Op99H+sHgsRMQ+E8fvYTDMkbfrbova8E8NBEID/WU4pWQ
	lYOGNTkMOpPi/3vmVRynJpx+sihL243EoCWxUDosTg8wFsp/HsRn+X4cZcZcaUr9a+ghqy
	5gAd2KXjiWypR8TcMEFDLkAzoooQz7E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-H-Qo59uePp-r-lir_upYpA-1; Sun, 09 Oct 2022 05:52:42 -0400
X-MC-Unique: H-Qo59uePp-r-lir_upYpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A10C829AA3BF;
	Sun,  9 Oct 2022 09:52:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 965C02166B4D;
	Sun,  9 Oct 2022 09:52:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5C80D1946595;
	Sun,  9 Oct 2022 09:52:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 692B11946586 for <linux-cachefs@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 09:52:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39D23477F5F; Sun,  9 Oct 2022 09:52:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 324AE477F5C
 for <linux-cachefs@redhat.com>; Sun,  9 Oct 2022 09:52:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15EAC1C0513C
 for <linux-cachefs@redhat.com>; Sun,  9 Oct 2022 09:52:40 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-0BnTSKmrNsig7B2u2FZ9FQ-1; Sun, 09 Oct 2022 05:52:38 -0400
X-MC-Unique: 0BnTSKmrNsig7B2u2FZ9FQ-1
Received: by mail-pg1-f178.google.com with SMTP id q9so8138538pgq.8
 for <linux-cachefs@redhat.com>; Sun, 09 Oct 2022 02:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vSVDnAgp4oFS6GtK5rwH8v4//Iq76mLV9/G+ci+5hkU=;
 b=ABx/D0nc4O+W/Yc1w8Fuk03r5N7DQMBmyVdnbb+2JlEpHByApv1diVb3Fcuv3qHKN2
 Mzngq/kRlfI93OG2GydFrJRiJgriUicAnxjpaqRym7RQDmW+AHyY0a3K7cqCOHE18mG5
 9V3rSiEo2kXdDpJClSBXZAZaHFakX2zHcJXtbfHCm9XRqZyx+sBCB+OS1aU9k5uZQtD/
 JR+qDD26hgAeNMmvUVAOr5nChvFozSK8y2OjDuXfhm4CJgMjAA4G7beX+sg4XWxr+gfA
 A5XRispEXacyPi4W/9xoS8dKhWk55Wk8w2S915lgozV2U5JLo/h02kx3xC9PE7ANrhEW
 rUtg==
X-Gm-Message-State: ACrzQf2aK8VL/7ihoK3Tpx9TR8FJFBvLtJWT43gjGSpMvzsXqdatX0s9
 4wS6QLD5pb3+qO+eC42u9g/PnQ==
X-Google-Smtp-Source: AMsMyM7IzOZu1tCczAGU+xbSMs7nJWyuEw0Ic2cn/6a4gM+q7tFnu7M34AMMxZfdqitGv9f1oFrLDg==
X-Received: by 2002:a65:44c1:0:b0:428:ab8f:62dd with SMTP id
 g1-20020a6544c1000000b00428ab8f62ddmr11994518pgs.211.1665309157196; 
 Sun, 09 Oct 2022 02:52:37 -0700 (PDT)
Received: from [10.3.156.122] ([63.216.146.187])
 by smtp.gmail.com with ESMTPSA id
 c82-20020a624e55000000b0056265011136sm4678686pfb.112.2022.10.09.02.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 02:52:36 -0700 (PDT)
Message-ID: <bdbf258d-096c-4c44-c195-0ecff7504a32@bytedance.com>
Date: Sun, 9 Oct 2022 17:52:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: JeffleXu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 xiang@kernel.org
References: <20220818135204.49878-1-zhujia.zj@bytedance.com>
 <20220818135204.49878-6-zhujia.zj@bytedance.com>
 <514c06f7-017d-bca5-6a87-0dae54c0d83d@linux.alibaba.com>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <514c06f7-017d-bca5-6a87-0dae54c0d83d@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [External] Re: [RFC PATCH 5/5] cachefiles: add
 restore command to recover inflight ondemand read requests
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMi8xMC84IDE3OjAwLCBKZWZmbGVYdSDlhpnpgZM6Cj4gCj4gCj4gT24gOC8xOC8y
MiA5OjUyIFBNLCBKaWEgWmh1IHdyb3RlOgo+PiBQcmV2aW91c2x5LCBpbiBvbmRlbWFuZCByZWFk
IHNjZW5hcmlvLCBpZiB0aGUgYW5vbnltb3VzIGZkIHdhcyBjbG9zZWQgYnkKPj4gdXNlciBkYWVt
b24sIGluZmxpZ2h0IGFuZCBzdWJzZXF1ZW50IHJlYWQgcmVxdWVzdHMgd291bGQgcmV0dXJuIEVJ
Ty4KPj4gQXMgbG9uZyBhcyB0aGUgZGV2aWNlIGNvbm5lY3Rpb24gaXMgbm90IHJlbGVhc2VkLCB1
c2VyIGRhZW1vbiBjYW4gaG9sZAo+PiBhbmQgcmVzdG9yZSBpbmZsaWdodCByZXF1ZXN0cyBieSBz
ZXR0aW5nIHRoZSByZXF1ZXN0IGZsYWcgdG8KPj4gQ0FDSEVGSUxFU19SRVFfTkVXLgo+Pgo+PiBT
dWdnZXN0ZWQtYnk6IEdhbyBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBKaWEgWmh1IDx6aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogWGluIFlpbiA8eWlueGluLnhAYnl0ZWRhbmNlLmNvbT4KPj4gLS0tCj4+ICAgZnMv
Y2FjaGVmaWxlcy9kYWVtb24uYyAgIHwgIDEgKwo+PiAgIGZzL2NhY2hlZmlsZXMvaW50ZXJuYWwu
aCB8ICAzICsrKwo+PiAgIGZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYyB8IDIzICsrKysrKysrKysr
KysrKysrKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9mcy9jYWNoZWZpbGVzL2RhZW1vbi5jIGIvZnMvY2FjaGVmaWxlcy9kYWVt
b24uYwo+PiBpbmRleCBjNzRiZDFmNGVjZjUuLjAxNDM2OTI2NmNiMiAxMDA2NDQKPj4gLS0tIGEv
ZnMvY2FjaGVmaWxlcy9kYWVtb24uYwo+PiArKysgYi9mcy9jYWNoZWZpbGVzL2RhZW1vbi5jCj4+
IEBAIC03Nyw2ICs3Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2FjaGVmaWxlc19kYWVtb25f
Y21kIGNhY2hlZmlsZXNfZGFlbW9uX2NtZHNbXSA9IHsKPj4gICAJeyAidGFnIiwJY2FjaGVmaWxl
c19kYWVtb25fdGFnCQl9LAo+PiAgICNpZmRlZiBDT05GSUdfQ0FDSEVGSUxFU19PTkRFTUFORAo+
PiAgIAl7ICJjb3BlbiIsCWNhY2hlZmlsZXNfb25kZW1hbmRfY29wZW4JfSwKPj4gKwl7ICJyZXN0
b3JlIiwJY2FjaGVmaWxlc19vbmRlbWFuZF9yZXN0b3JlCX0sCj4+ICAgI2VuZGlmCj4+ICAgCXsg
IiIsCQlOVUxMCQkJCX0KPj4gICB9Owo+PiBkaWZmIC0tZ2l0IGEvZnMvY2FjaGVmaWxlcy9pbnRl
cm5hbC5oIGIvZnMvY2FjaGVmaWxlcy9pbnRlcm5hbC5oCj4+IGluZGV4IGI0YWY2N2YxY2JkNi4u
ZDUwNGM2MWE1ZjAzIDEwMDY0NAo+PiAtLS0gYS9mcy9jYWNoZWZpbGVzL2ludGVybmFsLmgKPj4g
KysrIGIvZnMvY2FjaGVmaWxlcy9pbnRlcm5hbC5oCj4+IEBAIC0zMDMsNiArMzAzLDkgQEAgZXh0
ZXJuIHNzaXplX3QgY2FjaGVmaWxlc19vbmRlbWFuZF9kYWVtb25fcmVhZChzdHJ1Y3QgY2FjaGVm
aWxlc19jYWNoZSAqY2FjaGUsCj4+ICAgZXh0ZXJuIGludCBjYWNoZWZpbGVzX29uZGVtYW5kX2Nv
cGVuKHN0cnVjdCBjYWNoZWZpbGVzX2NhY2hlICpjYWNoZSwKPj4gICAJCQkJICAgICBjaGFyICph
cmdzKTsKPj4gICAKPj4gK2V4dGVybiBpbnQgY2FjaGVmaWxlc19vbmRlbWFuZF9yZXN0b3JlKHN0
cnVjdCBjYWNoZWZpbGVzX2NhY2hlICpjYWNoZSwKPj4gKwkJCQkJY2hhciAqYXJncyk7Cj4+ICsK
Pj4gICBleHRlcm4gaW50IGNhY2hlZmlsZXNfb25kZW1hbmRfaW5pdF9vYmplY3Qoc3RydWN0IGNh
Y2hlZmlsZXNfb2JqZWN0ICpvYmplY3QpOwo+PiAgIGV4dGVybiB2b2lkIGNhY2hlZmlsZXNfb25k
ZW1hbmRfY2xlYW5fb2JqZWN0KHN0cnVjdCBjYWNoZWZpbGVzX29iamVjdCAqb2JqZWN0KTsKPj4g
ICAKPj4gZGlmZiAtLWdpdCBhL2ZzL2NhY2hlZmlsZXMvb25kZW1hbmQuYyBiL2ZzL2NhY2hlZmls
ZXMvb25kZW1hbmQuYwo+PiBpbmRleCA3OWZmYjE5MzgwY2QuLjViMWM0NDdkYTk3NiAxMDA2NDQK
Pj4gLS0tIGEvZnMvY2FjaGVmaWxlcy9vbmRlbWFuZC5jCj4+ICsrKyBiL2ZzL2NhY2hlZmlsZXMv
b25kZW1hbmQuYwo+PiBAQCAtMTc4LDYgKzE3OCwyOSBAQCBpbnQgY2FjaGVmaWxlc19vbmRlbWFu
ZF9jb3BlbihzdHJ1Y3QgY2FjaGVmaWxlc19jYWNoZSAqY2FjaGUsIGNoYXIgKmFyZ3MpCj4+ICAg
CXJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiAraW50IGNhY2hlZmlsZXNfb25kZW1hbmRfcmVz
dG9yZShzdHJ1Y3QgY2FjaGVmaWxlc19jYWNoZSAqY2FjaGUsIGNoYXIgKmFyZ3MpCj4+ICt7Cj4+
ICsJc3RydWN0IGNhY2hlZmlsZXNfcmVxICpyZXE7Cj4+ICsKPj4gKwlYQV9TVEFURSh4YXMsICZj
YWNoZS0+cmVxcywgMCk7Cj4+ICsKPj4gKwlpZiAoIXRlc3RfYml0KENBQ0hFRklMRVNfT05ERU1B
TkRfTU9ERSwgJmNhY2hlLT5mbGFncykpCj4+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPj4gKwo+
PiArCS8qCj4+ICsJICogU2VhcmNoIHRoZSByZXF1ZXN0cyB3aGljaCBiZWluZyBwcm9jZXNzZWQg
YmVmb3JlCj4+ICsJICogdGhlIHVzZXIgZGFlbW9uIGNyYXNoZWQuCj4+ICsJICogU2V0IHRoZSBD
QUNIRUZJTEVTX1JFUV9ORVcgZmxhZyBhbmQgdXNlciBkYWVtb24gd2lsbCByZXByb2Nlc3MgaXQu
Cj4+ICsJICovCj4gCj4gVGhlIGNvbW1lbnQgY2FuIGJlIGltcHJvdmVkIGFzOgo+IAo+IAlSZXNl
dCB0aGUgcmVxdWVzdHMgdG8gQ0FDSEVGSUxFU19SRVFfTkVXIHN0YXRlLCBzbyB0aGF0IHRoZQo+
ICAgICAgICAgIHJlcXVlc3RzIGhhdmUgYmVlbiBwcm9jZXNzZWQgaGFsZndheSBiZWZvcmUgdGhl
IGNyYXNoIG9mIHRoZQo+ICAgICAgICAgIHVzZXIgZGFlbW9uIGNvdWxkIGJlIHJlcHJvY2Vzc2Vk
IGFmdGVyIHRoZSByZWNvdmVyeS4KPiAKVGhhbmtzLCBJJ2xsIGFwcGx5IGl0Lgo+IAo+PiArCXhh
c19sb2NrKCZ4YXMpOwo+PiArCXhhc19mb3JfZWFjaCgmeGFzLCByZXEsIFVMT05HX01BWCkKPj4g
KwkJeGFzX3NldF9tYXJrKCZ4YXMsIENBQ0hFRklMRVNfUkVRX05FVyk7Cj4+ICsJeGFzX3VubG9j
aygmeGFzKTsKPj4gKwo+PiArCXdha2VfdXBfYWxsKCZjYWNoZS0+ZGFlbW9uX3BvbGx3cSk7Cj4+
ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgaW50IGNhY2hlZmlsZXNfb25kZW1h
bmRfZ2V0X2ZkKHN0cnVjdCBjYWNoZWZpbGVzX3JlcSAqcmVxKQo+PiAgIHsKPj4gICAJc3RydWN0
IGNhY2hlZmlsZXNfb2JqZWN0ICpvYmplY3Q7Cj4gCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcg
bGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

