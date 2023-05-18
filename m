Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784970895D
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 May 2023 22:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684441269;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UOqwJLKmk+kw954EuQ5PdxI5YR0eQLDP5T+AAywGhVs=;
	b=HJcbFnkPjnSwsfcsZLIlaKV9mZlpDDfOtcg8yJeYQNr8Lf0trv8TQEkOXXKYrKUTxF0BXn
	dRXo0GSQQdo1TDaPkY+zFw/XhNdOhzxjNclD2sKlHEXwXN8G13K32VQKLLqG4wogU6LNii
	76b7ExJ2HQip4reGoHH5jthyp4C/HMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-NBtC9_JCPdi21lyyTSk3Bg-1; Thu, 18 May 2023 16:21:06 -0400
X-MC-Unique: NBtC9_JCPdi21lyyTSk3Bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BEE885A5A3;
	Thu, 18 May 2023 20:21:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD4842026D16;
	Thu, 18 May 2023 20:21:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E8DEE19465B7;
	Thu, 18 May 2023 20:21:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F20E319465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 May 2023 20:21:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D265CC164EE; Thu, 18 May 2023 20:21:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA437C15BA0
 for <linux-cachefs@redhat.com>; Thu, 18 May 2023 20:21:00 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF86D101A551
 for <linux-cachefs@redhat.com>; Thu, 18 May 2023 20:21:00 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206--zfaxtwqNzi9QLNErI2C9w-1; Thu, 18 May 2023 16:20:58 -0400
X-MC-Unique: -zfaxtwqNzi9QLNErI2C9w-1
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-965f7bdab6bso483380366b.3; 
 Thu, 18 May 2023 13:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684441256; x=1687033256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IYfdWrhTM0vY/FXglu2FZMvY3juyMMZCYRjkGLrO6E=;
 b=AcLYaDsDIC+4tYbPyVdtQjh8G7GkV8766ZnpyxF1uKMJxvvJDcxFLDEVvgUqwwzaN1
 0jqNB2GckWgNJpt78Gm55bPVh4EFwQ9iDtC4iOOE2AZ7OGqB5JRd9Q3fv4LeRxDsPaB4
 69YX9wHkwtyAcHTsMBMMHTo00m68PJr99U+rfOcBikZKAwed//xsnIWizm4y+B5q54IE
 i1ickWwBfmIPmgaXF97DqMdKGKpL+Riin4aYKiqQ0Uq0uXv6z4+V3twGeLyJACnHjAyg
 vH3aSI/meYmtEM/ePjpiBPel2qGiKPhwrQkXz3MSvrk9Dwr5b1f07faNAietXsRcCuRK
 nNsg==
X-Gm-Message-State: AC+VfDw/AR62A5sRyjMKLH+O6xvKdDpNstfmt5DR/vquL7ta7Okd9035
 y3UUfWg1KsYTAOS/Y7JYG2+TyOHClYeosqe/o2Lv/l8CezY=
X-Google-Smtp-Source: ACHHUZ4ghTodBcVeI1oP4kCrp5FKpyHiQ64DZdsmBqNTzTyEcziTJo5yHXI52J11VBtW6C+EDFm6TqoT7AZsivc8Eb8=
X-Received: by 2002:a17:907:2cc2:b0:96f:5cb3:df66 with SMTP id
 hg2-20020a1709072cc200b0096f5cb3df66mr362187ejc.18.1684441256107; Thu, 18 May
 2023 13:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
 <CALF+zO=1oASFeb5WOezeZm_fbCuw=L8AL-n-mbCt8A==ZMAy3Q@mail.gmail.com>
In-Reply-To: <CALF+zO=1oASFeb5WOezeZm_fbCuw=L8AL-n-mbCt8A==ZMAy3Q@mail.gmail.com>
From: Chris Chilvers <chilversc@gmail.com>
Date: Thu, 18 May 2023 21:20:46 +0100
Message-ID: <CAAmbk-cgTR+FxLY2C=upuPBwNaBYff=GHedXyQiFf=Hr5i3G0A@mail.gmail.com>
To: David Wysochanski <dwysocha@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [BUG] fscache writing but not reading
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
Cc: Benjamin Maynard <benmaynard@google.com>, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, brennandoyle@google.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAxNiBNYXkgMjAyMyBhdCAyMDoyOCwgRGF2aWQgV3lzb2NoYW5za2kgPGR3eXNvY2hh
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgMTE6NDLigK9B
TSBDaHJpcyBDaGlsdmVycyA8Y2hpbHZlcnNjQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hp
bGUgdGVzdGluZyB0aGUgZnNjYWNoZSBwZXJmb3JtYW5jZSBmaXhlcyBbMV0gdGhhdCB3ZXJlIG1l
cmdlZCBpbnRvIDYuNC1yYzEKPiA+IGl0IGFwcGVhcnMgdGhhdCB0aGUgY2FjaGluZyBubyBsb25n
ZXIgd29ya3MuIFRoZSBjbGllbnQgd2lsbCB3cml0ZSB0byB0aGUgY2FjaGUKPiA+IGJ1dCBuZXZl
ciByZWFkcy4KPiA+Cj4gVGhhbmtzIGZvciB0aGUgcmVwb3J0Lgo+Cj4gSWYgeW91IHJlYm9vdCBk
byB5b3Ugc2VlIHJlYWRzIGZyb20gdGhlIGNhY2hlPwoKT24gdGhlIGZpcnN0IHJlYWQgYWZ0ZXIg
YSByZWJvb3QgaXQgdXNlcyB0aGUgY2FjaGUsIGJ1dCBzdWJzZXF1ZW50CnJlYWRzIGRvIG5vdCB1
c2UgdGhlIGNhY2hlLgoKPiBZb3UgY2FuIGNoZWNrIGlmIHRoZSBjYWNoZSBpcyBiZWluZyByZWFk
IGZyb20gYnkgbG9va2luZyBpbgo+IC9wcm9jL2ZzL2ZzY2FjaGUvc3RhdHMKPiBhdCB0aGUgIklP
IiBsaW5lOgo+ICMgZ3JlcCBJTyAvcHJvYy9mcy9mc2NhY2hlL3N0YXRzCj4gSU8gICAgIDogcmQ9
ODAwMzAgd3I9MAoKUnVubmluZyB0aGUgdGVzdHMgNCB0aW1lcyAodHdpY2UgYmVmb3JlIHJlYm9v
dCwgYW5kIHR3aWNlIGFmdGVyKSBnaXZlCnRoZSBmb2xsb3dpbmcgbWV0cmljczoKRlMtQ2FjaGUg
SS9PIChkZWx0YSkKUnVuICAgICAgIHJkICAgICAgICB3cgogMSAgICAgICAgIDAgICAgMzksMjUw
CiAyICAgICAgIDEzMCAgICAzOCw4OTQKIDMgICAgMzksMDAwICAgICAgICAgMAogNCAgICAgICAg
NzIgICAgMzgsOTkxCgo+IENhbiB5b3Ugc2hhcmU6Cj4gMS4gTkZTIHNlcnZlciB5b3UncmUgdXNp
bmcgKGlzIGl0IGxvY2FsaG9zdCBvciBzb21ldGhpbmcgZWxzZSkKPiAyLiBORlMgdmVyc2lvbgoK
VGhlIE5GUyBzZXJ2ZXIgYW5kIGNsaWVudCBhcmUgc2VwYXJhdGUgVk1zIG9uIHRoZSBzYW1lIG5l
dHdvcmsuClNlcnZlciBORlMgdmVyc2lvbjogVWJ1bnR1IDIyLjA0IGphbW15LCBrZXJuZWwgNS4x
NS4wLTEwMjEtZ2NwCkNsaWVudCBORlMgdmVyc2lvbjogVWJ1bnR1IDIyLjA0IGphbW15LCBrZXJu
ZWwgNi40LjAtMDYwNDAwcmMxLWdlbmVyaWMKKGh0dHBzOi8va2VybmVsLnVidW50dS5jb20vfmtl
cm5lbC1wcGEvbWFpbmxpbmUvdjYuNC1yYzEvKQpDbGllbnQgbmZzLXV0aWxzOiAyLjYuMy1yYzYK
Q2xpZW50IGNhY2hlZmlsZXNkOiAwLjEwLjEwLTAuMnVidW50dTEKCj4gSW4gYWRkaXRpb24gdG8g
Y2hlY2tpbmcgdGhlIGFib3ZlIGZvciB0aGUgcmVhZHMgZnJvbSB0aGUgY2FjaGUsIHlvdSBjYW4g
YWxzbwo+IHNlZSB3aGV0aGVyIE5GUyByZWFkcyBhcmUgZ29pbmcgb3ZlciB0aGUgd2lyZSBwcmV0
dHkgZWFzaWx5IHdpdGggYSBzaW1pbGFyCj4gdGVjaG5pcXVlLgo+Cj4gQ29weSAvcHJvYy9zZWxm
L21vdW5zdGF0cyB0byBhIGZpbGUgYmVmb3JlIHlvdXIgdGVzdCwgdGhlbiBtYWtlIGEgc2Vjb25k
IGNvcHkKPiBhZnRlciB0aGUgdGVzdCwgdGhlbiBydW4gbW91bnRzdGF0cyBhcyBmb2xsb3dzOgo+
IG1vdW50c3RhdHMgLVMgL3RtcC9tb3VudHN0YXRzLjEgLWYgL3RtcC9tb3VudHN0YXRzLjIKCmFw
cCByZWFkICAgID0gYXBwbGljYXRpb25zIHJlYWQgYnl0ZXMgdmlhIHJlYWQoMikKY2xpZW50IHJl
YWQgPSBjbGllbnQgcmVhZCBieXRlcyB2aWEgTkZTIFJFQUQKClJ1biAgICAgICAgICAgYXBwIHJl
YWQgICAgICAgIGNsaWVudCByZWFkCiAxICAgICAzMjIsMTIyLDU0NywyMDAgICAgMzIyLDEyMiw1
NDcsMjAwCiAyICAgICAzMjIsMTIyLDU0NywyMDAgICAgMzIxLDA0OCw4MDUsMzc2CiAzICAgICAz
MjIsMTIyLDU0NywyMDAgICAgICAgICAgICAgICAgICAwCiA0ICAgICAzMjIsMTIyLDU0NywyMDAg
ICAgMzIxLDU5MywwNTMsMTg0CgpJJ3ZlIHB1dCB0aGUgZnVsbCBkYXRhIGluIGEgR2l0SHViIGdp
c3QsIGFsb25nIHdpdGggYSBncmFwaCBjb2xsZWN0ZWQKZnJvbSBhIG1ldHJpY3MgYWdlbnQ6Cmh0
dHBzOi8vZ2lzdC5naXRodWIuY29tL2NoaWx2ZXJzYy81NGViNzYxNTVhZDM3YjY2Y2I4NTE4NmU3
NDQ5YmVhYQpodHRwczovL2dpc3QuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2NoaWx2ZXJzYy81NGVi
NzYxNTVhZDM3YjY2Y2I4NTE4NmU3NDQ5YmVhYS9yYXcvMDk4MjhjNTk2ZDBjZmM0NGJjMGViNjdm
NDBlNDAzM2RiMjAyMzI2ZS9tZXRyaWNzLnBuZwoKLS0KTGludXgtY2FjaGVmcyBtYWlsaW5nIGxp
c3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtY2FjaGVmcwo=

