Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5277019D
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Aug 2023 15:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691155929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=mUjSsGwhfyyH5p1lBefFxwh6dkXaA7LMffWmtcj4n5E=;
	b=PdZYBVhu/ywTa6pXwCPYpTzxOd/jWQYa3iOf2JRnJ+sIo3w+BLMOha91khB48SedqhR3tp
	ZxnVK+FZu7Cu9zSMFHjaCg/Y6X9S+iEcleHS/LteL0TbsOqI4v4oHslMICRObInWCRlwXt
	s0gzuRwa0cA4HkUVpSHW2+aX9KoI0YU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-jxiZxd7TMem134sI2UnalA-1; Fri, 04 Aug 2023 09:32:03 -0400
X-MC-Unique: jxiZxd7TMem134sI2UnalA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACA4F8564EF;
	Fri,  4 Aug 2023 13:31:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B40A5477F63;
	Fri,  4 Aug 2023 13:31:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 669CE1946597;
	Fri,  4 Aug 2023 13:31:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C692D194658F for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Aug 2023 13:31:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D2E9492CAE; Fri,  4 Aug 2023 13:31:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C5F492B03
 for <linux-cachefs@redhat.com>; Fri,  4 Aug 2023 13:31:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B13B2812948
 for <linux-cachefs@redhat.com>; Fri,  4 Aug 2023 13:31:56 +0000 (UTC)
Received: from mail.salscheider.org (salscheider.org [202.61.254.1]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-Bbz-cSjrP7G69NEuetouWQ-1; Fri,
 04 Aug 2023 09:31:49 -0400
X-MC-Unique: Bbz-cSjrP7G69NEuetouWQ-1
Received: from [IPV6:2003:a:d79:b301:f09:7970:745a:8dba] (unknown
 [IPv6:2003:a:d79:b301:f09:7970:745a:8dba])
 by mail.salscheider.org (Postfix) with ESMTPSA id A505B38C1961;
 Fri,  4 Aug 2023 15:31:47 +0200 (CEST)
Message-ID: <7d87ade9-a2a4-8265-50cc-c882e9837d1c@salscheider.org>
Date: Fri, 4 Aug 2023 15:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Wysochanski <dwysocha@redhat.com>
References: <4b41feb3-cfa6-6a74-6505-d9a049139eb3@salscheider.org>
 <CALF+zOmrugawBwB7UgOjZweR-Hp9Lotg6nTrPj=f4zvboYBE8w@mail.gmail.com>
From: Ole Salscheider <ole@salscheider.org>
Autocrypt: addr=ole@salscheider.org; keydata=
 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
In-Reply-To: <CALF+zOmrugawBwB7UgOjZweR-Hp9Lotg6nTrPj=f4zvboYBE8w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] Files read from NFS instead of fscache when
 also in pagecache
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: salscheider.org
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgpPbiAwMi4wOC4yMyAxNzowOCwgRGF2aWQgV3lzb2NoYW5za2kgd3JvdGU6Cj4gT24gV2VkLCBB
dWcgMiwgMjAyMyBhdCAzOjM14oCvQU0gT2xlIFNhbHNjaGVpZGVyIDxvbGVAc2Fsc2NoZWlkZXIu
b3JnPiB3cm90ZToKPj4KPj4gSGVsbG8sCj4+Cj4+IEkgbm90aWNlZCBzb21lIHN0cmFuZ2UgYmVo
YXZpb3VyIG9mIGZzY2FjaGUgd2l0aCBrZXJuZWwgNi40LnggaW4KPj4gY29tYmluYXRpb24gd2l0
aCBORlMgKHY0LjIpIGFuZCB0aGUgcGFnZWNhY2hlLgo+Pgo+PiBJIGhhdmUgbXVsdGlwbGUgY2xp
ZW50cyBtb3VudGluZyBhbiBORlMgdjQuMiBmaWxlIHN5c3RlbSBmcm9tIGEgc2VydmVyCj4+IGFu
ZCBjYWNoaW5nIHRoZSBkYXRhIGxvY2FsbHkgdXNpbmcgZnNjYWNoZS4gQWZ0ZXIgYm9vdGluZyB0
aGUgY2xpZW50cywKPj4gbW9zdCBkYXRhIGlzIHNlcnZlZCBmcm9tIGZzY2FjaGUgYW5kIG9ubHkg
YSBmZXcgcmVxdWVzdHMgaGl0IHRoZSBORlMKPj4gc2VydmVyLiBCdXQgYWZ0ZXIgc29tZSBtaW51
dGVzIG9mIG9wZXJhdGlvbiAod2hpY2ggdHlwaWNhbGx5IGluY2x1ZGVzIGEKPj4gbG90IG9mIGN5
Y2xpYyBkYXRhIHJlYWRpbmcgZm9yIHVzKSwgZmV3ZXIgYW5kIGZld2VyIGZpbGVzIGFyZSBzZXJ2
ZWQKPj4gZnJvbSBmc2NhY2hlIGFuZCBtb3N0IGFyZSBzZXJ2ZWQgYnkgdGhlIE5GUyBzZXJ2ZXIu
Cj4+IEl0IHNlZW1zIHRoYXQgdGhpcyBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggdGhlIGZpbGVz
IGJlaW5nIGFsc28gaW4gdGhlCj4+IHBhZ2VjYWNoZS4gSWYgSSBwZXJpb2RjYWxseSBkcm9wIHRo
ZSBwYWdlY2FjaGUgd2l0aCAiZWNobyAzID4KPj4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzIiwg
dGhlbiBtb3N0IG9mIHRoZSBmaWxlcyBhcmUgc2VydmVkIGZyb20KPj4gZnNjYWNoZSBhZ2Fpbi4K
Pj4KPj4gSXMgdGhpcyBhIGtub3duIHByb2JsZW0/IElmIG5vdCwgZG8geW91IGhhdmUgYW55IHN1
Z2dlc3Rpb24gaG93IEkgY2FuCj4+IHRyeSB0byBmaW5kIHRoZSByb290IGNhdXNlPwo+Pgo+IAo+
IFllcyB0aGlzIGlzIG1vc3QgbGlrZWx5IGEga25vd24gcHJvYmxlbSB3aXRoIGEgZml4IG5vdyBp
biB0aGUKPiBtbS11bnN0YWJsZSBicmFuY2ggYXQKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvYWtwbS9tbQo+IElmIGl0J3MgdGhlIHNhbWUgcHJvYmxlbSwg
dGFrZSB0aGVzZSAzIHBhdGNoZXMgYW5kIHRoYXQgc2hvdWxkIGZpeCBpdDoKPiA2ZmJlZmJlMTc0
Y2EgbW06IGNhbGwgZm9saW9fbWFwcGluZygpIGluc2lkZSBmb2xpb19uZWVkc19yZWxlYXNlKCkK
PiAwNGNiOGRkYWI5MDIgbW0sIG5ldGZzLCBmc2NhY2hlOiBzdG9wIHJlYWQgb3B0aW1pc2F0aW9u
IHdoZW4gZm9saW8KPiByZW1vdmVkIGZyb20gcGFnZWNhY2hlCj4gODU0ZmM4YTU2N2FiIG1tOiBt
ZXJnZSBmb2xpb19oYXNfcHJpdmF0ZSgpL2ZpbGVtYXBfcmVsZWFzZV9mb2xpbygpIGNhbGwgcGFp
cnMKPiAKPiBUaGUgbWFpbiBwYXRjaCB0aGF0IGZpeGVzIGl0IGlzICIwNGNiOGRkYWI5MDIgbW0s
IG5ldGZzLCBmc2NhY2hlOiBTdG9wCj4gcmVhZCBvcHRpbWlzYXRpb24gd2hlbiBmb2xpbyByZW1v
dmVkIGZyb20gcGFnZWNhY2hlIiBidXQgdGhlcmUncyBhCj4gcHJlcmVxdWlzaXRlIHBhdGNoIGFu
ZCBhIGZpeHVwIHBhdGNoLgoKSSByYW4gc29tZSB0ZXN0cyB5ZXN0ZXJkYXkgYW5kIHRvZGF5LCBh
bmQgaXQgc2VlbXMgdGhhdCB0aGVzZSBwYXRjaGVzIApmaXggdGhlIHByb2JsZW0gY29tcGxldGVs
eS4gVGhhbmtzIQoKPiAKPiAKPj4gVGhhbmsgeW91IGluIGFkdmFuY2UhCj4+Cj4+IEJlc3QgcmVn
YXJkcywKPj4KPj4gT2xlCj4+Cj4+IC0tCj4+IExpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0Cj4+
IExpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQo+PiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMKPj4KPiAKCi0tCkxpbnV4LWNhY2hlZnMgbWFp
bGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

