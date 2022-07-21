Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9257FD11
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658743789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bGONmtSuIqqszwwIf/2l35lnjROBGUFTgzUOhEmE5Wk=;
	b=dhHAFYpHld/IQkI5fKATLCqkuhoipcI+olcNgP0bYRq8ZwCv/qmQ3rhmws7qmwkjcMy51G
	jryzJzMyf2rtLNOFASoQiPKOJdHdGq/KRxpkaXpjrElUNDwN/1jwJMY6hcZIb9l6/7xnOP
	3QVKdjo/X6c8QYvPPUc8RKC+0qleCS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-W4CTIpW1OPmHl-FX5mDaXQ-1; Mon, 25 Jul 2022 06:09:48 -0400
X-MC-Unique: W4CTIpW1OPmHl-FX5mDaXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF5E800124;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5C0FC28130;
	Mon, 25 Jul 2022 10:09:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 216D51945D97;
	Mon, 25 Jul 2022 10:09:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D0291947040 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 16:06:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE0241121314; Thu, 21 Jul 2022 16:06:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAE871121315
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 16:06:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32EE43C0D1AB
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 16:06:09 +0000 (UTC)
Received: from m13203.mail.163.com (m13203.mail.163.com [220.181.13.203]) by
 relay.mimecast.com with ESMTP id us-mta-647-HqJgPGGaNHmv0voHaHVtzQ-1; Thu,
 21 Jul 2022 12:06:04 -0400
X-MC-Unique: HqJgPGGaNHmv0voHaHVtzQ-1
Received: from slark_xiao$163.com ( [222.125.150.84] ) by
 ajax-webmail-wmsvr198 (Coremail) ; Fri, 22 Jul 2022 00:03:49 +0800
 (GMT+08:00)
X-Originating-IP: [222.125.150.84]
Date: Fri, 22 Jul 2022 00:03:49 +0800 (GMT+08:00)
From: "Slark Xiao" <slark_xiao@163.com>
To: kafai <kafai@fb.com>
X-Priority: 3
In-Reply-To: <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Message-ID: <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hceowAD3OkTmeNlibFpKAA--.42312W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJR5FZGAJpJ2X6AABs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Mon, 25 Jul 2022 10:09:45 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
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
Cc: linux-cachefs <linux-cachefs@redhat.com>,
 linux-doc <linux-doc@vger.kernel.org>, peterz <peterz@infradead.org>,
 bigeasy <bigeasy@linutronix.de>, ast <ast@kernel.org>, song <song@kernel.org>,
 sdf <sdf@google.com>, will <will@kernel.org>, Baoquan He <bhe@redhat.com>,
 corbet <corbet@lwn.net>, "william.gray" <william.gray@linaro.org>,
 "john.fastabend" <john.fastabend@gmail.com>, andrii <andrii@kernel.org>,
 mingo <mingo@redhat.com>, longman <longman@redhat.com>,
 dyoung <dyoung@redhat.com>, vgoyal <vgoyal@redhat.com>,
 "boqun.feng" <boqun.feng@gmail.com>, kpsingh <kpsingh@kernel.org>,
 yhs <yhs@fb.com>, tglx <tglx@linutronix.de>, haoluo <haoluo@google.com>,
 daniel <daniel@iogearbox.net>, kexec <kexec@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, jolsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, "martin.lau" <martin.lau@linux.dev>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64

TWF5IEkga25vdyB0aGUgbWFpbnRhaW5lciBvZiBvbmUgc3Vic3lzdGVtIGNvdWxkIG1lcmdlIHRo
ZSBjaGFuZ2VzIGNvbnRhaW5zIGxvdHMgb2Ygc3Vic3lzdGVtPwogSSBhbHNvIGtub3cgdGhpcyBj
b3VsZCBiZSBmaWx0ZXJlZCBieSBncmVwIGFuZCBzZWQgY29tbWFuZCwgYnV0IHRoYXQgcGF0Y2gg
d291bGQgaGF2ZSBkb3plbnMgb2YgbWFpbnRhaW5lcnMgYW5kIHJldmlld2Vycy4KCgoKLS0tLSBS
ZXBsaWVkIE1lc3NhZ2UgLS0tLQp8IEZyb20gfCBNYXJ0aW4gS2FGYWkgTGF1PGthZmFpQGZiLmNv
bT4gfAp8IERhdGUgfCAwNy8yMS8yMDIyIDIzOjQxIHwKfCBUbyB8IFNsYXJrIFhpYW88c2xhcmtf
eGlhb0AxNjMuY29tPiB8CnwgQ2MgfCBjb3JiZXRAbHduLm5ldDxjb3JiZXRAbHduLm5ldD6homJo
ZUByZWRoYXQuY29tPGJoZUByZWRoYXQuY29tPqGidmdveWFsQHJlZGhhdC5jb208dmdveWFsQHJl
ZGhhdC5jb20+oaJkeW91bmdAcmVkaGF0LmNvbTxkeW91bmdAcmVkaGF0LmNvbT6homFzdEBrZXJu
ZWwub3JnPGFzdEBrZXJuZWwub3JnPqGiZGFuaWVsQGlvZ2VhcmJveC5uZXQ8ZGFuaWVsQGlvZ2Vh
cmJveC5uZXQ+oaJhbmRyaWlAa2VybmVsLm9yZzxhbmRyaWlAa2VybmVsLm9yZz6hom1hcnRpbi5s
YXVAbGludXguZGV2PG1hcnRpbi5sYXVAbGludXguZGV2PqGic29uZ0BrZXJuZWwub3JnPHNvbmdA
a2VybmVsLm9yZz6honloc0BmYi5jb208eWhzQGZiLmNvbT6hompvaG4uZmFzdGFiZW5kQGdtYWls
LmNvbTxqb2huLmZhc3RhYmVuZEBnbWFpbC5jb20+oaJrcHNpbmdoQGtlcm5lbC5vcmc8a3BzaW5n
aEBrZXJuZWwub3JnPqGic2RmQGdvb2dsZS5jb208c2RmQGdvb2dsZS5jb20+oaJoYW9sdW9AZ29v
Z2xlLmNvbTxoYW9sdW9AZ29vZ2xlLmNvbT6hompvbHNhQGtlcm5lbC5vcmc8am9sc2FAa2VybmVs
Lm9yZz6hondpbGxpYW0uZ3JheUBsaW5hcm8ub3JnPHdpbGxpYW0uZ3JheUBsaW5hcm8ub3JnPqGi
ZGhvd2VsbHNAcmVkaGF0LmNvbTxkaG93ZWxsc0ByZWRoYXQuY29tPqGicGV0ZXJ6QGluZnJhZGVh
ZC5vcmc8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+oaJtaW5nb0ByZWRoYXQuY29tPG1pbmdvQHJlZGhh
dC5jb20+oaJ3aWxsQGtlcm5lbC5vcmc8d2lsbEBrZXJuZWwub3JnPqGibG9uZ21hbkByZWRoYXQu
Y29tPGxvbmdtYW5AcmVkaGF0LmNvbT6homJvcXVuLmZlbmdAZ21haWwuY29tPGJvcXVuLmZlbmdA
Z21haWwuY29tPqGidGdseEBsaW51dHJvbml4LmRlPHRnbHhAbGludXRyb25peC5kZT6homJpZ2Vh
c3lAbGludXRyb25peC5kZTxiaWdlYXN5QGxpbnV0cm9uaXguZGU+oaJrZXhlY0BsaXN0cy5pbmZy
YWRlYWQub3JnPGtleGVjQGxpc3RzLmluZnJhZGVhZC5vcmc+oaJsaW51eC1kb2NAdmdlci5rZXJu
ZWwub3JnPGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc+oaJsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+oaJicGZAdmdlci5rZXJuZWwub3Jn
PGJwZkB2Z2VyLmtlcm5lbC5vcmc+oaJsaW51eC1jYWNoZWZzQHJlZGhhdC5jb208bGludXgtY2Fj
aGVmc0ByZWRoYXQuY29tPiB8CnwgU3ViamVjdCB8IFJlOiBbUEFUQ0ggdjJdIGRvY3M6IEZpeCB0
eXBvIGluIGNvbW1lbnQgfApPbiBUaHUsIEp1bCAyMSwgMjAyMiBhdCAwOTo1NjowNUFNICswODAw
LCBTbGFyayBYaWFvIHdyb3RlOgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2JwZi9tYXBf
Y2dyb3VwX3N0b3JhZ2UucnN0IGIvRG9jdW1lbnRhdGlvbi9icGYvbWFwX2Nncm91cF9zdG9yYWdl
LnJzdAo+IGluZGV4IGNhYjk1NDMwMTdiZi4uOGU1ZmU1MzJjMDdlIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vYnBmL21hcF9jZ3JvdXBfc3RvcmFnZS5yc3QKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2JwZi9tYXBfY2dyb3VwX3N0b3JhZ2UucnN0Cj4gQEAgLTMxLDcgKzMxLDcgQEAgVGhlIG1h
cCB1c2VzIGtleSBvZiB0eXBlIG9mIGVpdGhlciBgYF9fdTY0IGNncm91cF9pbm9kZV9pZGBgIG9y
Cj4gICAgICB9Owo+ICAKPiAgYGBjZ3JvdXBfaW5vZGVfaWRgYCBpcyB0aGUgaW5vZGUgaWQgb2Yg
dGhlIGNncm91cCBkaXJlY3RvcnkuCj4gLWBgYXR0YWNoX3R5cGVgYCBpcyB0aGUgdGhlIHByb2dy
YW0ncyBhdHRhY2ggdHlwZS4KPiArYGBhdHRhY2hfdHlwZWBgIGlzIHRoZSBwcm9ncmFtJ3MgYXR0
YWNoIHR5cGUuCj4gIAo+ICBMaW51eCA1LjkgYWRkZWQgc3VwcG9ydCBmb3IgdHlwZSBgYF9fdTY0
IGNncm91cF9pbm9kZV9pZGBgIGFzIHRoZSBrZXkgdHlwZS4KPiAgV2hlbiB0aGlzIGtleSB0eXBl
IGlzIHVzZWQsIHRoZW4gYWxsIGF0dGFjaCB0eXBlcyBvZiB0aGUgcGFydGljdWxhciBjZ3JvdXAg
YW5kCj4gQEAgLTE1NSw3ICsxNTUsNyBAQCBIb3dldmVyLCB0aGUgQlBGIHByb2dyYW0gY2FuIHN0
aWxsIG9ubHkgYXNzb2NpYXRlIHdpdGggb25lIG1hcCBvZiBlYWNoIHR5cGUKPiAgYGBCUEZfTUFQ
X1RZUEVfQ0dST1VQX1NUT1JBR0VgYCBvciBtb3JlIHRoYW4gb25lCj4gIGBgQlBGX01BUF9UWVBF
X1BFUkNQVV9DR1JPVVBfU1RPUkFHRWBgLgo+ICAKPiAtSW4gYWxsIHZlcnNpb25zLCB1c2Vyc3Bh
Y2UgbWF5IHVzZSB0aGUgdGhlIGF0dGFjaCBwYXJhbWV0ZXJzIG9mIGNncm91cCBhbmQKPiArSW4g
YWxsIHZlcnNpb25zLCB1c2Vyc3BhY2UgbWF5IHVzZSB0aGUgYXR0YWNoIHBhcmFtZXRlcnMgb2Yg
Y2dyb3VwIGFuZAo+ICBhdHRhY2ggdHlwZSBwYWlyIGluIGBgc3RydWN0IGJwZl9jZ3JvdXBfc3Rv
cmFnZV9rZXlgYCBhcyB0aGUga2V5IHRvIHRoZSBCUEYgbWFwCj4gIEFQSXMgdG8gcmVhZCBvciB1
cGRhdGUgdGhlIHN0b3JhZ2UgZm9yIGEgZ2l2ZW4gYXR0YWNobWVudC4gRm9yIExpbnV4IDUuOQo+
ICBhdHRhY2ggdHlwZSBzaGFyZWQgc3RvcmFnZXMsIG9ubHkgdGhlIGZpcnN0IHZhbHVlIGluIHRo
ZSBzdHJ1Y3QsIGNncm91cCBpbm9kZQpGb3IgdGhlIGJwZiBjaGFuZ2VzLAoKQWNrZWQtYnk6IE1h
cnRpbiBLYUZhaSBMYXUgPGthZmFpQGZiLmNvbT4KLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxp
c3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

