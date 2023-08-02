Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98B76D119
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Aug 2023 17:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690988960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oRnUvMkelS8bX2C1vE029WCb1uDqb15FwGiG6r5l9ZQ=;
	b=CVP0cR2MB63lNeHml1hBHG3wcaqitpsXfFBtap1OFro4ShwUJ7lmaj3nT4WRmBYi7+BFej
	GR0BFB0ft4F71mgtOAXRGFfURxNoKy2WcS/2ZTTDxp1ZHgD4bDn8mWGiI7lzyC5w1ipkuU
	BSYg2FnyKkHc2Y/kbKXldOALbPT8bHU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-TrkTznC1NoCESABPhlFUeQ-1; Wed, 02 Aug 2023 11:09:17 -0400
X-MC-Unique: TrkTznC1NoCESABPhlFUeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5212999B33;
	Wed,  2 Aug 2023 15:09:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B26E201EE6E;
	Wed,  2 Aug 2023 15:09:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20F481946A79;
	Wed,  2 Aug 2023 15:09:10 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13DBB1946A45 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  2 Aug 2023 15:09:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB3921454147; Wed,  2 Aug 2023 15:09:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E36881454143
 for <linux-cachefs@redhat.com>; Wed,  2 Aug 2023 15:09:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C32891044592
 for <linux-cachefs@redhat.com>; Wed,  2 Aug 2023 15:09:03 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-z60sEl-rMGG9LRpCzNUkGg-1; Wed, 02 Aug 2023 11:09:02 -0400
X-MC-Unique: z60sEl-rMGG9LRpCzNUkGg-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2680f0cc480so4467197a91.0
 for <linux-cachefs@redhat.com>; Wed, 02 Aug 2023 08:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690988940; x=1691593740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QkXxP5XTEAhSrtJhuV/81Pem3KJOTQK/WafO+eCato=;
 b=YrDtojrW+8aw/0Unn4dvNvMJ8/YDykr4ypRsJZ1tNWzrvFTGJmWKc51qGvP8KU+aej
 CA5TbpWUBmYlVbzY3/bWfoLfX1qX9tVPCGXFuV7SwvlZpdGGYPyhV1Bv0modTOFum17C
 yizDmcnlrwIA1Ql1tHB4ri7JchGWDfiF3GM5L6A9xR5qv50tFshqtY+qLJVOiZ0qCeuH
 hCE/X0KGv4RqvVYZOUhnU4KfMz/+QxiC0TaHARpFBOrAxQVHI181yMa6Fx1Ms5q6Uaw9
 MOE4+sPdskG+Bb55ONMgi74PlJOY5ux5Dd78y1S7lJyJEgtw4ddSYRkb9EZ8DD44LVpm
 pO1Q==
X-Gm-Message-State: ABy/qLacl40/tVB/mNhf5d4wLnGUhMfn9wlXok4Z90LemBgm5jDdrhXa
 EazNeWBa2JkxJ+OezZi3NuLY4iLddQbP103BiuuzY56eFUNEUp+oAMW42JLBqwXie73oDLajs6x
 gF77xJFmw8+wSHQCiDY0aq5UlNmYPcFvGzD23DMLQ2TTB2GLI
X-Received: by 2002:a17:90b:8c4:b0:268:23d7:21c with SMTP id
 ds4-20020a17090b08c400b0026823d7021cmr13369677pjb.30.1690988940719; 
 Wed, 02 Aug 2023 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGiCsYdPXnWE3tZL/ZdbnYAWQMZSdHSdQeE12vwuQ0c9OudSFZhwfVJw3vPS/Jjs+D6XopoE1jaAeHUTIdZKlM=
X-Received: by 2002:a17:90b:8c4:b0:268:23d7:21c with SMTP id
 ds4-20020a17090b08c400b0026823d7021cmr13369657pjb.30.1690988940393; Wed, 02
 Aug 2023 08:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <4b41feb3-cfa6-6a74-6505-d9a049139eb3@salscheider.org>
In-Reply-To: <4b41feb3-cfa6-6a74-6505-d9a049139eb3@salscheider.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 2 Aug 2023 11:08:24 -0400
Message-ID: <CALF+zOmrugawBwB7UgOjZweR-Hp9Lotg6nTrPj=f4zvboYBE8w@mail.gmail.com>
To: Ole Salscheider <ole@salscheider.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAzOjM14oCvQU0gT2xlIFNhbHNjaGVpZGVyIDxvbGVAc2Fs
c2NoZWlkZXIub3JnPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gSSBub3RpY2VkIHNvbWUgc3RyYW5n
ZSBiZWhhdmlvdXIgb2YgZnNjYWNoZSB3aXRoIGtlcm5lbCA2LjQueCBpbgo+IGNvbWJpbmF0aW9u
IHdpdGggTkZTICh2NC4yKSBhbmQgdGhlIHBhZ2VjYWNoZS4KPgo+IEkgaGF2ZSBtdWx0aXBsZSBj
bGllbnRzIG1vdW50aW5nIGFuIE5GUyB2NC4yIGZpbGUgc3lzdGVtIGZyb20gYSBzZXJ2ZXIKPiBh
bmQgY2FjaGluZyB0aGUgZGF0YSBsb2NhbGx5IHVzaW5nIGZzY2FjaGUuIEFmdGVyIGJvb3Rpbmcg
dGhlIGNsaWVudHMsCj4gbW9zdCBkYXRhIGlzIHNlcnZlZCBmcm9tIGZzY2FjaGUgYW5kIG9ubHkg
YSBmZXcgcmVxdWVzdHMgaGl0IHRoZSBORlMKPiBzZXJ2ZXIuIEJ1dCBhZnRlciBzb21lIG1pbnV0
ZXMgb2Ygb3BlcmF0aW9uICh3aGljaCB0eXBpY2FsbHkgaW5jbHVkZXMgYQo+IGxvdCBvZiBjeWNs
aWMgZGF0YSByZWFkaW5nIGZvciB1cyksIGZld2VyIGFuZCBmZXdlciBmaWxlcyBhcmUgc2VydmVk
Cj4gZnJvbSBmc2NhY2hlIGFuZCBtb3N0IGFyZSBzZXJ2ZWQgYnkgdGhlIE5GUyBzZXJ2ZXIuCj4g
SXQgc2VlbXMgdGhhdCB0aGlzIGhhcyBzb21ldGhpbmcgdG8gZG8gd2l0aCB0aGUgZmlsZXMgYmVp
bmcgYWxzbyBpbiB0aGUKPiBwYWdlY2FjaGUuIElmIEkgcGVyaW9kY2FsbHkgZHJvcCB0aGUgcGFn
ZWNhY2hlIHdpdGggImVjaG8gMyA+Cj4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzIiwgdGhlbiBt
b3N0IG9mIHRoZSBmaWxlcyBhcmUgc2VydmVkIGZyb20KPiBmc2NhY2hlIGFnYWluLgo+Cj4gSXMg
dGhpcyBhIGtub3duIHByb2JsZW0/IElmIG5vdCwgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24g
aG93IEkgY2FuCj4gdHJ5IHRvIGZpbmQgdGhlIHJvb3QgY2F1c2U/Cj4KClllcyB0aGlzIGlzIG1v
c3QgbGlrZWx5IGEga25vd24gcHJvYmxlbSB3aXRoIGEgZml4IG5vdyBpbiB0aGUKbW0tdW5zdGFi
bGUgYnJhbmNoIGF0CmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9ha3BtL21tCklmIGl0J3MgdGhlIHNhbWUgcHJvYmxlbSwgdGFrZSB0aGVzZSAzIHBhdGNoZXMg
YW5kIHRoYXQgc2hvdWxkIGZpeCBpdDoKNmZiZWZiZTE3NGNhIG1tOiBjYWxsIGZvbGlvX21hcHBp
bmcoKSBpbnNpZGUgZm9saW9fbmVlZHNfcmVsZWFzZSgpCjA0Y2I4ZGRhYjkwMiBtbSwgbmV0ZnMs
IGZzY2FjaGU6IHN0b3AgcmVhZCBvcHRpbWlzYXRpb24gd2hlbiBmb2xpbwpyZW1vdmVkIGZyb20g
cGFnZWNhY2hlCjg1NGZjOGE1NjdhYiBtbTogbWVyZ2UgZm9saW9faGFzX3ByaXZhdGUoKS9maWxl
bWFwX3JlbGVhc2VfZm9saW8oKSBjYWxsIHBhaXJzCgpUaGUgbWFpbiBwYXRjaCB0aGF0IGZpeGVz
IGl0IGlzICIwNGNiOGRkYWI5MDIgbW0sIG5ldGZzLCBmc2NhY2hlOiBTdG9wCnJlYWQgb3B0aW1p
c2F0aW9uIHdoZW4gZm9saW8gcmVtb3ZlZCBmcm9tIHBhZ2VjYWNoZSIgYnV0IHRoZXJlJ3MgYQpw
cmVyZXF1aXNpdGUgcGF0Y2ggYW5kIGEgZml4dXAgcGF0Y2guCgoKCgo+IFRoYW5rIHlvdSBpbiBh
ZHZhbmNlIQo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gT2xlCj4KPiAtLQo+IExpbnV4LWNhY2hlZnMg
bWFpbGluZyBsaXN0Cj4gTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCj4gaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCj4KCi0tCkxpbnV4LWNh
Y2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3Rt
YW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

