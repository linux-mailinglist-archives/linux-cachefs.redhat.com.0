Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55570FB80
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 May 2023 18:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684944859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TyGtCb/lDMNzbesbPBkNQuva6ErWc7ZSwByxEimOhm8=;
	b=SVGKctsJP6wUoKDNXJx4mn3rkhyZsVFNKTA7uEK2BMJd/+Ls7yreDGaclo8LnX0rUSGuH5
	imQSsnn44p+dqiKZfSIpYxP4IdPm2pp/VwyGrLcDfB4vnF9kuizXs5g2lqOuVfLycMb41b
	V61ZhqBll3fN87TZV+l3BeRQfUHHFv0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338--ULnGyyHP5O_yRU7K9xj4w-1; Wed, 24 May 2023 12:14:17 -0400
X-MC-Unique: -ULnGyyHP5O_yRU7K9xj4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2021529AB434;
	Wed, 24 May 2023 16:14:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF9801121314;
	Wed, 24 May 2023 16:14:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2242219465B3;
	Wed, 24 May 2023 16:14:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 92FD919465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 May 2023 16:14:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3DF837AE4; Wed, 24 May 2023 16:14:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 365657AF5
 for <linux-cachefs@redhat.com>; Wed, 24 May 2023 16:14:13 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1756180027F
 for <linux-cachefs@redhat.com>; Wed, 24 May 2023 16:14:13 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-nKeiED4rMDSiShTRa2LlVg-1; Wed, 24 May 2023 12:14:09 -0400
X-MC-Unique: nKeiED4rMDSiShTRa2LlVg-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-5289ce45f11so2608a12.0
 for <linux-cachefs@redhat.com>; Wed, 24 May 2023 09:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944848; x=1687536848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ8HGz/8PogFAssEpLQqVOmne0GpZ/pJdJitN20arrE=;
 b=WvB0+iQnHNTeDyfdoJhNnyeWGr6loxBfyMvxQQdUly9/Cb031WUAA0RzwXdyhcuZ4B
 lDjGw2cLvyS3zLot6TobMhipYlC0JRyxcY7bdzznEGhoIhUAWcYNXhCrBJQk4F9LyQX4
 kqJeI74AsLwYvQv/J4nK3ws11O6uwFdbywmAaNUsQ7ma/CxAgzrbAo5aiEYdJC/op45f
 td7J23k8N6Ym9WYwGTVk1Ll+taVMTt2NNMSuWsUpwh9n//sqkF8fNGBE9pB1caRCthJ3
 JM5E3BMvVT8V7YGNP193/+WWmep31zQ3bQdBl2QK/gFVa3/kX/YLCKvbWrnzaxRFGo0j
 gyRQ==
X-Gm-Message-State: AC+VfDy58ba6CJTpsHWGh9Qeb8B9DW3XhVxokf3OL1pBe4NI71pj08jK
 L3GtfapFKpdAbnB1+GZ4fMEqZphpNgaIQO1k9+srxaGXEI4OPTKwReSIYbHZVDTJDPlAXFG2Mz9
 FHHRgfG4dQavt4Ni7fKb5oiKa7KGCiiypRu6ETQ==
X-Received: by 2002:a17:903:32cd:b0:1a9:581b:fbb1 with SMTP id
 i13-20020a17090332cd00b001a9581bfbb1mr20622414plr.32.1684944848420; 
 Wed, 24 May 2023 09:14:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ksRPI6C4Qbm3XTs2zMXExteCDHT1ueFX45NNxUR3Bmh0dl7msPgHXt9a+INLTvOYk2oEw3SpVm/ptycvFULM=
X-Received: by 2002:a17:903:32cd:b0:1a9:581b:fbb1 with SMTP id
 i13-20020a17090332cd00b001a9581bfbb1mr20622391plr.32.1684944848109; Wed, 24
 May 2023 09:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
 <CALF+zO=1oASFeb5WOezeZm_fbCuw=L8AL-n-mbCt8A==ZMAy3Q@mail.gmail.com>
 <CAAmbk-cgTR+FxLY2C=upuPBwNaBYff=GHedXyQiFf=Hr5i3G0A@mail.gmail.com>
 <CALF+zO=vjPjs8QevssUmGHA_bZaTaF3HcqQa+OQgxegqB5yzmw@mail.gmail.com>
In-Reply-To: <CALF+zO=vjPjs8QevssUmGHA_bZaTaF3HcqQa+OQgxegqB5yzmw@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 24 May 2023 12:13:32 -0400
Message-ID: <CALF+zOn_qX4tcT2ucq4jD3G-1ERqZkL6Cw7hx75OnQF0ivqSeA@mail.gmail.com>
To: Chris Chilvers <chilversc@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBNYXkgMTksIDIwMjMgYXQgNzo1M+KAr0FNIERhdmlkIFd5c29jaGFuc2tpIDxkd3lz
b2NoYUByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDQ6MjHi
gK9QTSBDaHJpcyBDaGlsdmVycyA8Y2hpbHZlcnNjQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gVHVlLCAxNiBNYXkgMjAyMyBhdCAyMDoyOCwgRGF2aWQgV3lzb2NoYW5za2kgPGR3eXNvY2hh
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIE1heSAxNiwgMjAyMyBhdCAx
MTo0MuKAr0FNIENocmlzIENoaWx2ZXJzIDxjaGlsdmVyc2NAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPgo+ID4gPiA+IFdoaWxlIHRlc3RpbmcgdGhlIGZzY2FjaGUgcGVyZm9ybWFuY2UgZml4ZXMg
WzFdIHRoYXQgd2VyZSBtZXJnZWQgaW50byA2LjQtcmMxCj4gPiA+ID4gaXQgYXBwZWFycyB0aGF0
IHRoZSBjYWNoaW5nIG5vIGxvbmdlciB3b3Jrcy4gVGhlIGNsaWVudCB3aWxsIHdyaXRlIHRvIHRo
ZSBjYWNoZQo+ID4gPiA+IGJ1dCBuZXZlciByZWFkcy4KPiA+ID4gPgo+ID4gPiBUaGFua3MgZm9y
IHRoZSByZXBvcnQuCj4gPiA+Cj4gPiA+IElmIHlvdSByZWJvb3QgZG8geW91IHNlZSByZWFkcyBm
cm9tIHRoZSBjYWNoZT8KPiA+Cj4gPiBPbiB0aGUgZmlyc3QgcmVhZCBhZnRlciBhIHJlYm9vdCBp
dCB1c2VzIHRoZSBjYWNoZSwgYnV0IHN1YnNlcXVlbnQKPiA+IHJlYWRzIGRvIG5vdCB1c2UgdGhl
IGNhY2hlLgo+ID4KPiA+ID4gWW91IGNhbiBjaGVjayBpZiB0aGUgY2FjaGUgaXMgYmVpbmcgcmVh
ZCBmcm9tIGJ5IGxvb2tpbmcgaW4KPiA+ID4gL3Byb2MvZnMvZnNjYWNoZS9zdGF0cwo+ID4gPiBh
dCB0aGUgIklPIiBsaW5lOgo+ID4gPiAjIGdyZXAgSU8gL3Byb2MvZnMvZnNjYWNoZS9zdGF0cwo+
ID4gPiBJTyAgICAgOiByZD04MDAzMCB3cj0wCj4gPgo+ID4gUnVubmluZyB0aGUgdGVzdHMgNCB0
aW1lcyAodHdpY2UgYmVmb3JlIHJlYm9vdCwgYW5kIHR3aWNlIGFmdGVyKSBnaXZlCj4gPiB0aGUg
Zm9sbG93aW5nIG1ldHJpY3M6Cj4gPiBGUy1DYWNoZSBJL08gKGRlbHRhKQo+ID4gUnVuICAgICAg
IHJkICAgICAgICB3cgo+ID4gIDEgICAgICAgICAwICAgIDM5LDI1MAo+ID4gIDIgICAgICAgMTMw
ICAgIDM4LDg5NAo+ID4gIDMgICAgMzksMDAwICAgICAgICAgMAo+ID4gIDQgICAgICAgIDcyICAg
IDM4LDk5MQo+ID4KPiA+ID4gQ2FuIHlvdSBzaGFyZToKPiA+ID4gMS4gTkZTIHNlcnZlciB5b3Un
cmUgdXNpbmcgKGlzIGl0IGxvY2FsaG9zdCBvciBzb21ldGhpbmcgZWxzZSkKPiA+ID4gMi4gTkZT
IHZlcnNpb24KPiA+Cj4gPiBUaGUgTkZTIHNlcnZlciBhbmQgY2xpZW50IGFyZSBzZXBhcmF0ZSBW
TXMgb24gdGhlIHNhbWUgbmV0d29yay4KPiA+IFNlcnZlciBORlMgdmVyc2lvbjogVWJ1bnR1IDIy
LjA0IGphbW15LCBrZXJuZWwgNS4xNS4wLTEwMjEtZ2NwCj4gPiBDbGllbnQgTkZTIHZlcnNpb246
IFVidW50dSAyMi4wNCBqYW1teSwga2VybmVsIDYuNC4wLTA2MDQwMHJjMS1nZW5lcmljCj4gPiAo
aHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+a2VybmVsLXBwYS9tYWlubGluZS92Ni40LXJjMS8p
Cj4gPiBDbGllbnQgbmZzLXV0aWxzOiAyLjYuMy1yYzYKPiA+IENsaWVudCBjYWNoZWZpbGVzZDog
MC4xMC4xMC0wLjJ1YnVudHUxCj4gPgo+ID4gPiBJbiBhZGRpdGlvbiB0byBjaGVja2luZyB0aGUg
YWJvdmUgZm9yIHRoZSByZWFkcyBmcm9tIHRoZSBjYWNoZSwgeW91IGNhbiBhbHNvCj4gPiA+IHNl
ZSB3aGV0aGVyIE5GUyByZWFkcyBhcmUgZ29pbmcgb3ZlciB0aGUgd2lyZSBwcmV0dHkgZWFzaWx5
IHdpdGggYSBzaW1pbGFyCj4gPiA+IHRlY2huaXF1ZS4KPiA+ID4KPiA+ID4gQ29weSAvcHJvYy9z
ZWxmL21vdW5zdGF0cyB0byBhIGZpbGUgYmVmb3JlIHlvdXIgdGVzdCwgdGhlbiBtYWtlIGEgc2Vj
b25kIGNvcHkKPiA+ID4gYWZ0ZXIgdGhlIHRlc3QsIHRoZW4gcnVuIG1vdW50c3RhdHMgYXMgZm9s
bG93czoKPiA+ID4gbW91bnRzdGF0cyAtUyAvdG1wL21vdW50c3RhdHMuMSAtZiAvdG1wL21vdW50
c3RhdHMuMgo+ID4KPiA+IGFwcCByZWFkICAgID0gYXBwbGljYXRpb25zIHJlYWQgYnl0ZXMgdmlh
IHJlYWQoMikKPiA+IGNsaWVudCByZWFkID0gY2xpZW50IHJlYWQgYnl0ZXMgdmlhIE5GUyBSRUFE
Cj4gPgo+ID4gUnVuICAgICAgICAgICBhcHAgcmVhZCAgICAgICAgY2xpZW50IHJlYWQKPiA+ICAx
ICAgICAzMjIsMTIyLDU0NywyMDAgICAgMzIyLDEyMiw1NDcsMjAwCj4gPiAgMiAgICAgMzIyLDEy
Miw1NDcsMjAwICAgIDMyMSwwNDgsODA1LDM3Ngo+ID4gIDMgICAgIDMyMiwxMjIsNTQ3LDIwMCAg
ICAgICAgICAgICAgICAgIDAKPiA+ICA0ICAgICAzMjIsMTIyLDU0NywyMDAgICAgMzIxLDU5Myww
NTMsMTg0Cj4gPgo+ID4gSSd2ZSBwdXQgdGhlIGZ1bGwgZGF0YSBpbiBhIEdpdEh1YiBnaXN0LCBh
bG9uZyB3aXRoIGEgZ3JhcGggY29sbGVjdGVkCj4gPiBmcm9tIGEgbWV0cmljcyBhZ2VudDoKPiA+
IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2NoaWx2ZXJzYy81NGViNzYxNTVhZDM3YjY2Y2I4NTE4
NmU3NDQ5YmVhYQo+ID4gaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9jaGlsdmVy
c2MvNTRlYjc2MTU1YWQzN2I2NmNiODUxODZlNzQ0OWJlYWEvcmF3LzA5ODI4YzU5NmQwY2ZjNDRi
YzBlYjY3ZjQwZTQwMzNkYjIwMjMyNmUvbWV0cmljcy5wbmcKPiA+Cj4KPiBUaGFua3MgQ2hyaXMg
Zm9yIGFsbCB0aGlzIGluZm8uICBJIHNlZSB5b3UncmUgdXNpbmcgTkZTdjMgc28gSSdsbAo+IGZv
Y3VzIG9uIHRoYXQsIGFuZCByZXZpZXcgYWxsIHRoaXMgaW5mbyBmb3IgY2x1ZXMuCj4gSSBhbHNv
IGhhdmUgYmVlbiB3b3JraW5nIG9uIHNvbWUgdXBkYXRlZCB0ZXN0IGNhc2VzIGFuZCBzZWUgc29t
ZSB2ZXJ5Cj4gdW51c3VhbCBiZWhhdmlvciBsaWtlIHlvdSdyZSByZXBvcnRpbmcuCj4KPiBJIGFs
c28gY29uZmlybWVkIHRoYXQgYWRkaW5nIHRoZSB0d28gcGF0Y2hlcyBmb3IgIklzc3VlICMxIiAg
b250bwo+IDYuNC1yYzEgcmVzb2x2ZSBfbW9zdF8gb2YgdGhlIGNhY2hpbmcgaXNzdWVzLgo+IEhv
d2V2ZXIsIGV2ZW4gYWZ0ZXIgdGhvc2UgcGF0Y2hlcywgaW4gc29tZSBsaW1pdGVkIGluc3RhbmNl
cywgdGhlcmUKPiBhcmUgc3RpbGwgTkZTIHJlYWRzIG92ZXIgdGhlIHdpcmUgd2hlbiB0aGVyZSBz
aG91bGQgb25seSBiZSByZWFkcyBmcm9tCj4gdGhlIGNhY2hlLgo+IFRoZXJlIG1heSBiZSBtdWx0
aXBsZSBidWdzIGhlcmUuCgpJIGFjdHVhbGx5IG1pc3Nwb2tlIHJlZ2FyZGluZyAibXVsdGlwbGUg
YnVncyIsIGFzIEkgZm9yZ290IHRvIGFkZCBhCnNtYWxsIE5GUyBodW5rIChzZWUgYmVsb3cpIG5l
ZWRlZCB0byBkaG93ZWxscyAybmQgcGF0Y2ggKHY2IG9mIG1tLApuZXRmcywgZnNjYWNoZTogU3Rv
cCByZWFkIG9wdGltaXNhdGlvbiB3aGVuIGZvbGlvIHJlbW92ZWQgZnJvbQpwYWdlY2FjaGUpLgpB
ZnRlciB0aGUgYmVsb3cgc21hbGwgaHVuayB3YXMgYWRkZWQgb24gdG9wIG9mIGRob3dlbGxzIDJu
ZCBwYXRjaCwgYWxsCm15IHRlc3RzIHBhc3MuCkkndmUgYWxzbyBlbmhhbmNlZCBteSBleGlzdGlu
ZyB0ZXN0cyB0byBjaGVjayBORlMgUkVBRHMsIGZzY2FjaGUKUkVBRHMsIGFuZCBmc2NhY2hlIFdS
SVRFcyBhcyBleHBlY3RlZC4KQW5kIEkgYWRkZWQgYW4gYWRkaXRpb25hbCB0ZXN0IHRvIGNyZWF0
ZSBmaWxlcyB0aGUgc2l6ZSBvZiBSQU0sIHJlYWQKdGhlbSBtdWx0aXBsZSB0aW1lcywgYW5kIGNo
ZWNrIGZvciB0aGUgb3BzIGFyZSBhcyBleHBlY3RlZC4KU28gSSdtIGNvbmZpZGVudCBpZiB3ZSBh
ZGQgZGhvd2VsbHMgMiBwYXRjaGVzLCBwbHVzIHRoZSBiZWxvdyBodW5rIGZvcgpORlMsIHRoZXNl
IGNhY2hpbmcgaXNzdWVzIHdpbGwgYmUgcmVzb2x2ZWQuCgpkaWZmIC0tZ2l0IGEvZnMvbmZzL2Zz
Y2FjaGUuYyBiL2ZzL25mcy9mc2NhY2hlLmMKaW5kZXggOGMzNWQ4OGE4NGIxLi5kNGEyMDc0OGIx
NGYgMTAwNjQ0Ci0tLSBhL2ZzL25mcy9mc2NhY2hlLmMKKysrIGIvZnMvbmZzL2ZzY2FjaGUuYwpA
QCAtMTgwLDYgKzE4MCwxMCBAQCB2b2lkIG5mc19mc2NhY2hlX2luaXRfaW5vZGUoc3RydWN0IGlu
b2RlICppbm9kZSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmYXV4ZGF0YSwgICAgICAvKiBhdXhfZGF0YSAqLwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihhdXhkYXRhKSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpX3NpemVfcmVhZChpbm9kZSkpOworCisgICAg
ICAgaWYgKG5ldGZzX2lub2RlKGlub2RlKS0+Y2FjaGUpCisgICAgICAgICAgICAgICBtYXBwaW5n
X3NldF9yZWxlYXNlX2Fsd2F5cyhpbm9kZS0+aV9tYXBwaW5nKTsKKwogfQoKIC8qCgotLQpMaW51
eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9s
aXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

