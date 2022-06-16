Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC554E5A5
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Jun 2022 17:04:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-BXQc5TR0P_2j55d-QD5Fmg-1; Thu, 16 Jun 2022 11:04:17 -0400
X-MC-Unique: BXQc5TR0P_2j55d-QD5Fmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A0D185A581;
	Thu, 16 Jun 2022 15:04:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A71D7111F5;
	Thu, 16 Jun 2022 15:04:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 771751947061;
	Thu, 16 Jun 2022 15:04:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C4BA5194705A for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 16 Jun 2022 15:04:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B597F111F5; Thu, 16 Jun 2022 15:04:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0F2A18EAC
 for <linux-cachefs@redhat.com>; Thu, 16 Jun 2022 15:04:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94D6629DD98C
 for <linux-cachefs@redhat.com>; Thu, 16 Jun 2022 15:04:13 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-2R2-LP5zObGdf7vTI-ZBrA-1; Thu, 16 Jun 2022 11:04:11 -0400
X-MC-Unique: 2R2-LP5zObGdf7vTI-ZBrA-1
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-10113b4c2b5so2201400fac.6
 for <linux-cachefs@redhat.com>; Thu, 16 Jun 2022 08:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zoPzQU7tFCHKbazE96n62nKhOYL6lpl30iCKAfHWF3k=;
 b=XqWcouBIvnKOJSUnYI/VkNtCDsvchX48r/fEhKbl+X9GfBpKh5AjcQdFhVRTofRAlJ
 2iJYhWBlznpDbzFPUanKcRB44NqO/shVSSWPJxVsGZt7gbxpNMlKXpt+Qvcu5b3NqZKo
 qoTiq22gXwhbZZmMqoyZxBhl0XfMLJ1vXZTVvldK8Ad1bETXS7UL0hD2ar+Wi9ZsSpjr
 caDbxicg6ck0+DEQET8UOkOCUJQrKy6CHbA/4ab6AJGyj2PyapI2e3mZ15h/HgnBRHmw
 YRvJn3Z7oSxPXTkNDyeIimWEbtXR+sYVW6pKpEJG8zSunO9megTmKRmw6OJMp4UyXYUa
 Ykqg==
X-Gm-Message-State: AJIora/DUoa6/AoWvN4e9gbaWfoZtPKFUkTJz/ZyMZ1dLSuv+TotGfF6
 ksNVTmE4oWyuvk//9NgxbKY8Fg==
X-Google-Smtp-Source: AGRyM1t/ql2JMv1ewpAojMoM3/cs4LVSN9IuvwaxwKyqaHE21iNNhZqbPJBxqQN/Cljh9oFWXsyihg==
X-Received: by 2002:a05:6870:c181:b0:f1:ea2f:f7f7 with SMTP id
 h1-20020a056870c18100b000f1ea2ff7f7mr8618905oad.18.1655391849854; 
 Thu, 16 Jun 2022 08:04:09 -0700 (PDT)
Received: from [192.168.0.41] ([184.4.90.121])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a4ab345000000b0035eb4e5a6d6sm1098587ooo.44.2022.06.16.08.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 08:04:08 -0700 (PDT)
Message-ID: <9fe9cd9f-1ded-a179-8ded-5fde8960a586@cloudflare.com>
Date: Thu, 16 Jun 2022 10:04:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Casey Schaufler <casey@schaufler-ca.com>, Paul Moore
 <paul@paul-moore.com>, Ignat Korchagin <ignat@cloudflare.com>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
 <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
 <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
 <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
 <20220615103031.qkzae4xr34wysj4b@wittgenstein>
 <CAHC9VhR8yPHZb2sCu4JGgXOSs7rudm=9opB+-LsG6_Lta9466A@mail.gmail.com>
 <CALrw=nGZtrNYn+CV+Q_w-2=Va_9m3C8PDvvPtd01d0tS=2NMWQ@mail.gmail.com>
 <CAHC9VhRSzXeAZmBdNSAFEh=6XR57ecO7Ov+6BV9b0xVN1YR_Qw@mail.gmail.com>
 <1c4b1c0d-12f6-6e9e-a6a3-cdce7418110c@schaufler-ca.com>
From: Frederick Lawler <fred@cloudflare.com>
In-Reply-To: <1c4b1c0d-12f6-6e9e-a6a3-cdce7418110c@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v3] cred: Propagate
 security_prepare_creds() error code
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
Cc: linux-aio@kvack.org, Christian Brauner <brauner@kernel.org>,
 linux-doc@vger.kernel.org, selinux@vger.kernel.org, linux-cifs@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, amir73il@gmail.com,
 samba-technical@lists.samba.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 netdev <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 kernel-team <kernel-team@cloudflare.com>, linux-nfs@vger.kernel.org,
 serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNi8xNS8yMiAxMDo1NSBBTSwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+IE9uIDYvMTUvMjAy
MiA4OjMzIEFNLCBQYXVsIE1vb3JlIHdyb3RlOgo+PiBPbiBXZWQsIEp1biAxNSwgMjAyMiBhdCAx
MTowNiBBTSBJZ25hdCBLb3JjaGFnaW4gCj4+IDxpZ25hdEBjbG91ZGZsYXJlLmNvbT4gd3JvdGU6
Cj4+PiBPbiBXZWQsIEp1biAxNSwgMjAyMiBhdCAzOjE0IFBNIFBhdWwgTW9vcmUgPHBhdWxAcGF1
bC1tb29yZS5jb20+IHdyb3RlOgo+Pj4+IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDY6MzAgQU0g
Q2hyaXN0aWFuIEJyYXVuZXIgCj4+Pj4gPGJyYXVuZXJAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IC4u
Lgo+Pgo+Pj4+PiBGd2l3LCBmcm9tIHRoaXMgY29tbWl0IGl0IHdhc24ndCB2ZXJ5IGNsZWFyIHdo
YXQgeW91IHdhbnRlZCB0byBhY2hpZXZlCj4+Pj4+IHdpdGggdGhpcy4gSXQgbWlnaHQgYmUgd29y
dGggY29uc2lkZXJpbmcgYWRkaW5nIGEgbmV3IHNlY3VyaXR5IGhvb2sgCj4+Pj4+IGZvcgo+Pj4+
PiB0aGlzLiBXaXRoaW4gbXNmdCBpdCByZWNlbnRseSBjYW1lIHVwIFNFTGludXggbWlnaHQgaGF2
ZSBhbiAKPj4+Pj4gaW50ZXJlc3QgaW4KPj4+Pj4gc29tZXRoaW5nIGxpa2UgdGhpcyBhcyB3ZWxs
Lgo+Pj4+IEp1c3QgdG8gY2xhcmlmeSB0aGluZ3MgYSBiaXQsIEkgYmVsaWV2ZSBTRUxpbnV4IHdv
dWxkIGhhdmUgYW4gaW50ZXJlc3QKPj4+PiBpbiBhIExTTSBob29rIGNhcGFibGUgb2YgaW1wbGVt
ZW50aW5nIGFuIGFjY2VzcyBjb250cm9sIHBvaW50IGZvciB1c2VyCj4+Pj4gbmFtZXNwYWNlcyBy
ZWdhcmRsZXNzIG9mIE1pY3Jvc29mdCdzIGN1cnJlbnQgbmVlZHMuwqAgSSBzdXNwZWN0IGR1ZSB0
bwo+Pj4+IHRoZSBzZWN1cml0eSByZWxldmFudCBuYXR1cmUgb2YgdXNlciBuYW1lc3BhY2VzIG1v
c3Qgb3RoZXIgTFNNcyB3b3VsZAo+Pj4+IGJlIGludGVyZXN0ZWQgYXMgd2VsbDsgaXQgc2VlbXMg
bGlrZSBhIHdlbGwgY3JhZnRlZCBob29rIHdvdWxkIGJlCj4+Pj4gd2VsY29tZSBieSBtb3N0IGZv
bGtzIEkgdGhpbmsuCj4+PiBKdXN0IHRvIGdldCB0aGUgZnVsbCBwaWN0dXJlOiBpcyB0aGVyZSBh
Y3R1YWxseSBhIGdvb2QgcmVhc29uIG5vdCB0bwo+Pj4gbWFrZSB0aGlzIGhvb2sgc3VwcG9ydCB0
aGlzIHNjZW5hcmlvPyBJIHVuZGVyc3RhbmQgaXQgd2FzIG5vdAo+Pj4gb3JpZ2luYWxseSBpbnRl
bmRlZCBmb3IgdGhpcywgYnV0IGl0IGlzIHdlbGwgcG9zaXRpb25lZCBpbiB0aGUgY29kZSwKPj4+
IGNvdmVycyBtdWx0aXBsZSBzdWJzeXN0ZW1zIChub3Qgb25seSB1c2VyIG5hbWVzcGFjZXMpLCBk
b2Vzbid0IHJlcXVpcmUKPj4+IGNoYW5naW5nIHRoZSBMU00gaW50ZXJmYWNlIGFuZCBpdCBhbHJl
YWR5IGRvZXMgdGhlIGpvYiAtIGp1c3QgdGhlCj4+PiBrZXJuZWwgaW50ZXJuYWxzIG5lZWQgdG8g
cmVzcGVjdCB0aGUgZXJyb3IgY29kZSBiZXR0ZXIuIFdoYXQgYmFkCj4+PiB0aGluZ3MgY2FuIGhh
cHBlbiBpZiB3ZSBleHRlbmQgaXRzIHVzZSBjYXNlIHRvIG5vdCBvbmx5IGFsbG9jYXRlCj4+PiBy
ZXNvdXJjZXMgaW4gTFNNcz8KPj4gTXkgY29uY2VybiBpcyB0aGF0IHRoZSBzZWN1cml0eV9wcmVw
YXJlX2NyZWRzKCkgaG9vaywgd2hpbGUgb25seQo+PiBjYWxsZWQgZnJvbSB0d28gZGlmZmVyZW50
IGZ1bmN0aW9ucywgZW5kcyB1cCBiZWluZyBjYWxsZWQgZm9yIGEKPj4gdmFyaWV0eSBvZiBkaWZm
ZXJlbnQgdXNlcyAobG9vayBhdCB0aGUgcHJlcGFyZV9jcmVkcygpIGFuZAo+PiBwZXJwYXJlX2tl
cm5lbF9jcmVkKCkgY2FsbGVycykgYW5kIEkgdGhpbmsgaXQgd291bGQgYmUgYSBjaGFsbGVuZ2Ug
dG8KPj4gaWRlbnRpZnkgdGhlIHByb3BlciBjYWxsaW5nIGNvbnRleHQgaW4gdGhlIExTTSBob29r
IGltcGxlbWVudGF0aW9uCj4+IGdpdmVuIHRoZSBjdXJyZW50IGhvb2sgcGFyYW1ldGVycy7CoCBP
bmUgbWlnaHQgYmUgYWJsZSB0byBtb2RpZnkgdGhlCj4+IGhvb2sgdG8gcGFzcyB0aGUgbmVjZXNz
YXJ5IGluZm9ybWF0aW9uLCBidXQgSSBkb24ndCB0aGluayB0aGF0IHdvdWxkCj4+IGJlIGFueSBj
bGVhbmVyIHRoYW4gYWRkaW5nIGEgdXNlcm5zIHNwZWNpZmljIGhvb2suwqAgSSdtIGFsc28gZ3Vl
c3NpbmcKPj4gdGhhdCB0aGUgbW9kaWZpZWQgc2VjdXJpdHlfcHJlcGFyZV9jcmVkcygpIGhvb2sg
aW1wbGVtZW50YXRpb25zIHdvdWxkCj4+IGFsc28gYmUgbW9yZSBsaWtlbHkgdG8gZW5jb3VudGVy
IGZ1dHVyZSBtYWludGVuYW5jZSBpc3N1ZXMgYXMKPj4gb3ZlcnJpZGluZyBjcmVkZW50aWFscyBp
biB0aGUga2VybmVsIHNlZW1zIG9ubHkgdG8gYmUgaW5jcmVhc2luZywgYW5kCj4+IGVhY2ggZnV0
dXJlIGNhbGxlciB3b3VsZCByaXNrIHVzaW5nIHRoZSBtb2RpZmllZCBob29rIHdyb25nIGJ5IHBh
c3NpbmcKPj4gdGhlIHdyb25nIGNvbnRleHQgYW5kIHRyaWdnZXJpbmcgdGhlIHdyb25nIGJlaGF2
aW9yIGluIHRoZSBMU00uCj4gCj4gV2UgZG9uJ3QgdXN1YWxseSBoYXZlIGhvb2tzIHRoYXQgZG8g
Ym90aCBhdHRyaWJ1dGUgbWFuYWdlbWVudCBhbmQKPiBhY2Nlc3MgY29udHJvbC4gU29tZSBwZW9w
bGUgc2VlbSBleGNlc3NpdmVseSBjb25jZXJuZWQgYWJvdXQgImNsdXR0ZXJpbmciCj4gY2FsbGlu
ZyBjb2RlIHdpdGggc2VjdXJpdHlfc29tZXRoaW5nKCkgaW5zdGFuY2VzLCBidXQgZm9yIHRoZSBt
b3N0Cj4gcGFydCBJIHRoaW5rIHdlJ3JlIHBhc3QgdGhhdC4gSSBhZ3JlZSB0aGF0IG1ha2luZyBz
ZWN1cml0eV9wcmVwYXJlX2NyZWRzKCkKPiBtdWx0aS1wdXJwb3NlIGlzIGEgYmFkIGlkZWEuIFNo
YXJlZCBjcmVkIG1hbmFnZW1lbnQgaXNuJ3Qgc2ltcGxlLCBhbmQKPiBhZGRpbmcgYWNjZXNzIGNo
ZWNrcyB0aGVyZSBpcyBvbmx5IGdvaW5nIHRvIG1ha2UgaXQgd29yc2UuCj4gCgpTb3VuZHMgbGlr
ZSB3ZSd2ZSByZWFjaGVkIHRoZSBjb25jbHVzaW9uIG5vdCB0byBwcm9jZWVkIHdpdGggYSB2NCBv
ZiAKdGhpcyBwYXRjaC4gSSdsbCBwaXZvdCB0byBwcm9wb3NlIGEgbmV3IGhvb2sgaW5zdGVhZC4K
ClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIGV2ZXJ5b25lIDopCgpGcmVkCgotLQpMaW51eC1jYWNo
ZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

