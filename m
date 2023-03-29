Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6261B6CD165
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Mar 2023 07:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680066384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OM8+a62xaTnHh5ZDjOdv49oz/I1EVySy0LFhMa2kGEA=;
	b=Jk+aG9CEM4mVbv61TpP1AhgViPrPU5eZBsWvqElbW27rrv8HzSMcD+n9iPA7jAiJLLZi23
	SUblRmbu8qiCpBIsw/NO+ysk3SDC0VUUSceIjCVuvTfbjBQWF5nq3V2HDxvAcdVZ+YMNDR
	zrRTEhcN7chN8nDKQ3ZXVdzf7/rmgz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-UXJMFVDMOQKx7zwvqNE1xQ-1; Wed, 29 Mar 2023 01:06:20 -0400
X-MC-Unique: UXJMFVDMOQKx7zwvqNE1xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38438185A790;
	Wed, 29 Mar 2023 05:06:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7328B2166B33;
	Wed, 29 Mar 2023 05:06:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 376BF1946597;
	Wed, 29 Mar 2023 05:06:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57457194658C for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 05:06:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3762914171BB; Wed, 29 Mar 2023 05:06:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F824140EBF4
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 05:06:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D20AE3813F40
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 05:06:17 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-1WZ7VM2BNUCqyToN1UQ5oA-1; Wed, 29 Mar 2023 01:06:15 -0400
X-MC-Unique: 1WZ7VM2BNUCqyToN1UQ5oA-1
Received: by mail-pj1-f45.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so14982865pjz.1
 for <linux-cachefs@redhat.com>; Tue, 28 Mar 2023 22:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680066375;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GjcLq9TYMSCEM1QxXkGT3Sk7emAp6wIFay5f/IdlFCI=;
 b=mjaVvwDEHiPZFiHR5rTWYdJywrZtt1LZktIRgjGigrwc7BFtdyqDopGnlDyz7hJNRk
 37xsuz49k75ddddY1eUHWbNEVPBmFgbEnKswi1gcaEGVIhw9gLst6znDI4sXlYKrNihq
 2kdqXlv/+dUEccf4+Ng2nxVZcDoQPTN8psfw3+a7rc2yCW5PWZ0p/zlmJ6paY6VUmTK9
 ZVkTddNRlovnuE1AXx+fJ7SN/6RRxsa9ReGliEWNBk6CxppVFFVtZDbScGfPMeEOU39X
 Xs29xnoa7GcQWwFEVoWzuZ0Pv/2WZfnGaRWRfKW+AtvWghmTp7CGT69Xy7UpLkrAs3Lo
 0u3g==
X-Gm-Message-State: AAQBX9fBnXzWGUtBT6N+4Ty4UDvuRg+BUeDDUDuJuKxe2sMvPckFsTvz
 c7XLH6X6WMiXEmth6Qha/5rssg==
X-Google-Smtp-Source: AKy350ZTGNkadk5EkErfDhJ6zlZsX/8WZzxktyRHEWZEs7dxg+S3jbdRlD777MfiA6AK1tAh84FLZg==
X-Received: by 2002:a17:90b:1a88:b0:23e:aba9:d51d with SMTP id
 ng8-20020a17090b1a8800b0023eaba9d51dmr19242110pjb.7.1680066374750; 
 Tue, 28 Mar 2023 22:06:14 -0700 (PDT)
Received: from [10.3.144.50] ([61.213.176.7]) by smtp.gmail.com with ESMTPSA id
 dw24-20020a17090b095800b0023cff7e39a6sm463394pjb.22.2023.03.28.22.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 22:06:14 -0700 (PDT)
Message-ID: <1b99542d-f21b-a27b-fc59-d4fe38e893de@bytedance.com>
Date: Wed, 29 Mar 2023 13:06:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: David Howells <dhowells@redhat.com>
References: <20230111052515.53941-3-zhujia.zj@bytedance.com>
 <20230111052515.53941-1-zhujia.zj@bytedance.com>
 <132137.1680011908@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <132137.1680011908@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH V4 2/5] cachefiles: extract ondemand
 info field from cachefiles_object
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
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggMjAyMy8zLzI4IDIxOjU4LCBEYXZpZCBIb3dlbGxzIOWGmemBkzoKPiBKaWEgWmh1IDx6
aHVqaWEuempAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gCj4+IEBAIC02NSwxMCArNzEsNyBAQCBz
dHJ1Y3QgY2FjaGVmaWxlc19vYmplY3Qgewo+PiAgIAllbnVtIGNhY2hlZmlsZXNfY29udGVudAkJ
Y29udGVudF9pbmZvOjg7CS8qIEluZm8gYWJvdXQgY29udGVudCBwcmVzZW5jZSAqLwo+PiAgIAl1
bnNpZ25lZCBsb25nCQkJZmxhZ3M7Cj4+ICAgI2RlZmluZSBDQUNIRUZJTEVTX09CSkVDVF9VU0lO
R19UTVBGSUxFCTAJCS8qIEhhdmUgYW4gdW5saW5rZWQgdG1wZmlsZSAqLwo+PiAtI2lmZGVmIENP
TkZJR19DQUNIRUZJTEVTX09OREVNQU5ECj4+IC0JaW50CQkJCW9uZGVtYW5kX2lkOwo+PiAtCWVu
dW0gY2FjaGVmaWxlc19vYmplY3Rfc3RhdGUJc3RhdGU7Cj4+IC0jZW5kaWYKPj4gKwlzdHJ1Y3Qg
Y2FjaGVmaWxlc19vbmRlbWFuZF9pbmZvCSpwcml2YXRlOwo+IAo+IFdoeSBpcyB0aGlzIG5vIGxv
bmdlciBpbnNpZGUgIiNpZmRlZiBDT05GSUdfQ0FDSEVGSUxFU19PTkRFTUFORCI/Cj4gCgpJJ2xs
IHJldmlzZSBpdCBpbiBuZXh0IHZlcnNpb24uCgo+IEFsc28sIHBsZWFzZSBkb24ndCBjYWxsIGl0
ICJwcml2YXRlIiwgYnV0IHJhdGhlciBzb21ldGhpbmcgbGlrZSAib25kZW1hbmQiIG9yCj4gIm9u
ZGVtYW5kX2luZm8iLgoKSSdsbCB1c2UgQG9uZGVtYW5kIHRvIHJlcGxhY2UgaXQuClRoYW5rcy4K
PiAKPiBEYXZpZAo+IAoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVm
c0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtY2FjaGVmcwo=

