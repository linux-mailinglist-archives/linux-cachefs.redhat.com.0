Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11870DF07
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 May 2023 16:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684851465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eTPv+aHkMsB6sYxOnGTM1lz0tec2k60EKcwYVw9ysBw=;
	b=TcpULtEJCtcwBBiAsohMEVOt5i8opJtT3qMnqgnpdkjGE9CYaIvJ0250loDkUpI6ilcpWi
	MI9IEOAkSyqxQiJYoLw8FmDcsctF9Nx9xG4ZAegmSKIxkfsfZAdVKWuldiw8hH/zbgVQ/n
	PHoChTiSbLrhDpdyOe+tGcLVhfocqpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-O18oHN_IMMK1EzdQVCd1fw-1; Tue, 23 May 2023 10:17:41 -0400
X-MC-Unique: O18oHN_IMMK1EzdQVCd1fw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1386885A5BF;
	Tue, 23 May 2023 14:17:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCD43492B0A;
	Tue, 23 May 2023 14:17:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0BD3519465BA;
	Tue, 23 May 2023 14:16:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C02C419465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 23 May 2023 14:16:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1A932166B26; Tue, 23 May 2023 14:16:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9C3E2166B25
 for <linux-cachefs@redhat.com>; Tue, 23 May 2023 14:16:27 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BE60811E7F
 for <linux-cachefs@redhat.com>; Tue, 23 May 2023 14:16:27 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-8L1aR8zgPFGrFmExtRHoxQ-1; Tue, 23 May 2023 10:16:26 -0400
X-MC-Unique: 8L1aR8zgPFGrFmExtRHoxQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1ae7eea1d5dso27521725ad.1
 for <linux-cachefs@redhat.com>; Tue, 23 May 2023 07:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684851385; x=1687443385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXevKoPQwiFGHwq9nGKjHKlx/3Ohg2Dgx/FXTwi5sJQ=;
 b=enoXNwbmhFw3xDNHNIhCLNyGI/+F/aZN73uZ8YOwsf6iaIU01izKSNcXYmEvsAZZWE
 EL5owFFitJaBUxrJD4eldvOqg++xXHBBI6OZnfai1TJq7QpkJaGTqrEYD8gX95PZA19o
 3AL+eOE4AjtNeULZsFg414Zq2kySh5lTH9A+98HSte4pzgArIhT3Yeq5FTXmmjDuHx69
 s9ZUo/BKKQqJ8kqGykryTQOZs9xbdqF23vkpnqkBSFj8DIgoQeA2zh9vMiiUPVZx4AfK
 ulFOXRyrRFq8qkDMhHvjfphOXv9qQHkQLCnR+/JCY7uWKtqL0jr9a+2GQ61j752MlX9e
 OPhQ==
X-Gm-Message-State: AC+VfDy3xI/wz9ibsDjVM+DQOBNlVk9ja948ElJanavthRge0YYPiSNr
 6WNdI5j7aI+5W9Wze8cfW87td9unWIXLSzHmkhkmyMAzYtH6/hd1fplAhRdtO1RRuGh1DCD/+Em
 +l3YSssQI01kLAR19k6gIFSe11hpQE0kwXSiCRw==
X-Received: by 2002:a17:903:22c2:b0:1ac:85b0:1bd8 with SMTP id
 y2-20020a17090322c200b001ac85b01bd8mr16543106plg.34.1684851384946; 
 Tue, 23 May 2023 07:16:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7aCu6qjWZ7mqb2kw4apev+HbB34++pQI4nia2PrTT1D3sbB8KQocc/hRgFO03FObSCC2wmqneiVCfLu1dhpkk=
X-Received: by 2002:a17:903:22c2:b0:1ac:85b0:1bd8 with SMTP id
 y2-20020a17090322c200b001ac85b01bd8mr16543083plg.34.1684851384654; Tue, 23
 May 2023 07:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
 <1744185.1684489212@warthog.procyon.org.uk>
 <CAAmbk-ffz-6LqkEo+XavgiuefZK7BOHC7648ZhSs0BN88N=M4A@mail.gmail.com>
In-Reply-To: <CAAmbk-ffz-6LqkEo+XavgiuefZK7BOHC7648ZhSs0BN88N=M4A@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 23 May 2023 10:15:48 -0400
Message-ID: <CALF+zOmbORezpTam09CAvZmPu2KzwR==KNpA32xe90eVkSDK0g@mail.gmail.com>
To: Chris Chilvers <chilversc@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: brennandoyle@google.com, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgNzoxOOKAr0FNIENocmlzIENoaWx2ZXJzIDxjaGlsdmVy
c2NAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMTkgTWF5IDIwMjMgYXQgMTA6NDAsIERh
dmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IENocmlzIENo
aWx2ZXJzIDxjaGlsdmVyc2NAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+IFdoaWxlIHRlc3Rp
bmcgdGhlIGZzY2FjaGUgcGVyZm9ybWFuY2UgZml4ZXMgWzFdIHRoYXQgd2VyZSBtZXJnZWQgaW50
byA2LjQtcmMxCj4gPiA+IGl0IGFwcGVhcnMgdGhhdCB0aGUgY2FjaGluZyBubyBsb25nZXIgd29y
a3MuIFRoZSBjbGllbnQgd2lsbCB3cml0ZSB0byB0aGUgY2FjaGUKPiA+ID4gYnV0IG5ldmVyIHJl
YWRzLgo+ID4KPiA+IENhbiB5b3UgdHJ5IHJlYWRpbmcgZnJvbSBhZnM/ICBZb3Ugd291bGQgbmVl
ZCB0byBlbmFibGUgQ09ORklHX0FGU19GUyBpbiB5b3VyCj4gPiBrZXJuZWwgaWYgaXQncyBub3Qg
YWxyZWFkeSBzZXQuCj4gPgo+ID4gSW5zdGFsbCBrYWZzLWNsaWVudCBhbmQgZG86Cj4gPgo+ID4g
ICAgICAgICBzeXN0ZW1jdGwgZW5hYmxlIGFmcy5tb3VudAo+ID4gICAgICAgICBtZDVzdW0gL2Fm
cy9vcGVuYWZzLm9yZy9zb2Z0d2FyZS9vcGVuYWZzLzEuOS4xL29wZW5hZnMtMS45LjEtZG9jLnRh
ci5iejIKPiA+ICAgICAgICAgY2F0IC9wcm9jL2ZzL2ZzY2FjaGUvc3RhdHMKPgo+IEZTLUNhY2hl
IHN0YXRpc3RpY3MKPiBDb29raWVzOiBuPTEzIHY9NyB2Y29sPTAgdm9vbT0wCj4gQWNxdWlyZTog
bj0xMyBvaz0xMyBvb209MAo+IExSVSAgICA6IG49MSBleHA9MCBybXY9MCBkcnA9MCBhdD0yODMz
Cj4gSW52YWxzIDogbj0wCj4gVXBkYXRlczogbj0wIHJzej0wIHJzbj0wCj4gUmVsaW5xczogbj0w
IHJ0cj0wIGRyb3A9MAo+IE5vU3BhY2U6IG53cj0wIG5jcj0wIGN1bGw9MAo+IElPICAgICA6IHJk
PTAgd3I9MTgKPiBSZEhlbHAgOiBSQT0xOCBSUD0wIFdCPTAgV0JaPTAgcnI9MCBzcj0wCj4gUmRI
ZWxwIDogWlI9MSBzaD0wIHNrPTAKPiBSZEhlbHAgOiBETD0xOCBkcz0xOCBkZj0wIGRpPTAKPiBS
ZEhlbHAgOiBSRD0wIHJzPTAgcmY9MAo+IFJkSGVscCA6IFdSPTE4IHdzPTE4IHdmPTAKPgo+IFRo
aXMgd2FzIG9uIGFuIGluc3RhbmNlIHRoYXQgd2FzIG9ubHkganVzdCBjcmVhdGVkLCBzbyB0aGUg
Y2FjaGUgd2FzCj4gaW5pdGlhbGx5IHVudXNlZCAoYWxsIHRoZSBjb3VudGVycyB3ZXJlIDApLgo+
Cj4gPiAgICAgICAgIHVtb3VudCAvYWZzL29wZW5hZnMub3JnCj4gPiAgICAgICAgIG1kNXN1bSAv
YWZzL29wZW5hZnMub3JnL3NvZnR3YXJlL29wZW5hZnMvMS45LjEvb3BlbmFmcy0xLjkuMS1kb2Mu
dGFyLmJ6Mgo+ID4gICAgICAgICBjYXQgL3Byb2MvZnMvZnNjYWNoZS9zdGF0cwo+Cj4gRlMtQ2Fj
aGUgc3RhdGlzdGljcwo+IENvb2tpZXM6IG49MTMgdj03IHZjb2w9MCB2b29tPTAKPiBBY3F1aXJl
OiBuPTI2IG9rPTI2IG9vbT0wCj4gTFJVICAgIDogbj0xIGV4cD0xIHJtdj0wIGRycD0wIGF0PTQ2
Nwo+IEludmFscyA6IG49MAo+IFVwZGF0ZXM6IG49MCByc3o9MCByc249MAo+IFJlbGlucXM6IG49
MTMgcnRyPTAgZHJvcD0xMwo+IE5vU3BhY2U6IG53cj0wIG5jcj0wIGN1bGw9MAo+IElPICAgICA6
IHJkPTE4IHdyPTE4Cj4gUmRIZWxwIDogUkE9MzYgUlA9MCBXQj0wIFdCWj0wIHJyPTAgc3I9MAo+
IFJkSGVscCA6IFpSPTEgc2g9MCBzaz0wCj4gUmRIZWxwIDogREw9MTggZHM9MTggZGY9MCBkaT0w
Cj4gUmRIZWxwIDogUkQ9MTggcnM9MTggcmY9MAo+IFJkSGVscCA6IFdSPTE4IHdzPTE4IHdmPTAK
Pgo+IExvb2tzIGxpa2UgdGhlIGNhY2hlIGlzIHdvcmtpbmcgZmluZSB3aXRoIEFGUy4gVGhlIHNl
Y29uZCBtZDVzdW0KPiBzZWVtZWQgYSBsb3QgcXVpY2tlciB0aGFuIHRoZSBmaXJzdC4KPgo+IC0t
Cj4gTGludXgtY2FjaGVmcyBtYWlsaW5nIGxpc3QKPiBMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20K
PiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hl
ZnMKPgoKSSBkb24ndCB0aGluayB0aGlzIHRlc3QgZGVtb25zdHJhdGVzIHRoZSBmYWlsdXJlIENo
cmlzIGlzIHNlZWluZywgb3IKY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcgQ2hyaXMuCgpDaHJpcywg
ZG9lcyB0aGlzIHNhbWUgdGVzdCBmYWlsIGZvciB5b3Ugd2l0aCBORlMgb24gNi40LXJjMT8gIFRo
ZSBzYW1lCnRlc3QgcGFzc2VzIGZvciBtZSB3aXRoIE5GU3YzLgoxc3QgdGltZSB0aHJvdWdoOiB3
cml0ZXMgdG8gdGhlIGNhY2hlIHNlZW4sIG5vIHJlYWRzOiBJTyAgICAgOiByZD0wIHdyPTE2CjJu
ZCB0aW1lIHRocm91Z2g6IHJlYWRzIGZyb20gdGhlIGNhY2hlIHNlZW4sIG5vIHdyaXRlczogSU8g
ICAgIDogcmQ9MTYgd3I9MTYKCgojIG1vdW50IC1vIHZlcnM9Myxmc2MgMTI3LjAuMC4xOi9leHBv
cnQvIC9tbnQvbmZzCiMgY2F0IC9wcm9jL2ZzL2ZzY2FjaGUvc3RhdHMKRlMtQ2FjaGUgc3RhdGlz
dGljcwpDb29raWVzOiBuPTAgdj0xIHZjb2w9MCB2b29tPTAKQWNxdWlyZTogbj0wIG9rPTAgb29t
PTAKTFJVICAgIDogbj0wIGV4cD0wIHJtdj0wIGRycD0wIGF0PTAKSW52YWxzIDogbj0wClVwZGF0
ZXM6IG49MCByc3o9MCByc249MApSZWxpbnFzOiBuPTAgcnRyPTAgZHJvcD0wCk5vU3BhY2U6IG53
cj0wIG5jcj0wIGN1bGw9MApJTyAgICAgOiByZD0wIHdyPTAKUmRIZWxwIDogUkE9MCBSUD0wIFdC
PTAgV0JaPTAgcnI9MCBzcj0wClJkSGVscCA6IFpSPTAgc2g9MCBzaz0wClJkSGVscCA6IERMPTAg
ZHM9MCBkZj0wIGRpPTAKUmRIZWxwIDogUkQ9MCBycz0wIHJmPTAKUmRIZWxwIDogV1I9MCB3cz0w
IHdmPTAKIyBtZDVzdW0gL21udC9uZnMvb3BlbmFmcy0xLjkuMS1kb2MudGFyLmJ6MgpjYTI1NTMw
ZWMwMWFmYzNiNzFiYzA4MWJjOTNiODdjZiAgL21udC9uZnMvb3BlbmFmcy0xLjkuMS1kb2MudGFy
LmJ6MgojIGNhdCAvcHJvYy9mcy9mc2NhY2hlL3N0YXRzCkZTLUNhY2hlIHN0YXRpc3RpY3MKQ29v
a2llczogbj0xIHY9MSB2Y29sPTAgdm9vbT0wCkFjcXVpcmU6IG49MSBvaz0xIG9vbT0wCkxSVSAg
ICA6IG49MSBleHA9MCBybXY9MCBkcnA9MCBhdD02NDQ0CkludmFscyA6IG49MApVcGRhdGVzOiBu
PTEgcnN6PTAgcnNuPTAKUmVsaW5xczogbj0wIHJ0cj0wIGRyb3A9MApOb1NwYWNlOiBud3I9MCBu
Y3I9MCBjdWxsPTAKSU8gICAgIDogcmQ9MCB3cj0xNgpSZEhlbHAgOiBSQT0xNiBSUD0wIFdCPTAg
V0JaPTAgcnI9MCBzcj0wClJkSGVscCA6IFpSPTEgc2g9MCBzaz0wClJkSGVscCA6IERMPTE2IGRz
PTE2IGRmPTAgZGk9MApSZEhlbHAgOiBSRD0wIHJzPTAgcmY9MApSZEhlbHAgOiBXUj0xNiB3cz0x
NiB3Zj0wCiMgdW1vdW50IC9tbnQvbmZzCiMgbW91bnQgLW8gdmVycz0zLGZzYyAxMjcuMC4wLjE6
L2V4cG9ydC8gL21udC9uZnMKIyBtZDVzdW0gL21udC9uZnMvb3BlbmFmcy0xLjkuMS1kb2MudGFy
LmJ6MgpjYTI1NTMwZWMwMWFmYzNiNzFiYzA4MWJjOTNiODdjZiAgL21udC9uZnMvb3BlbmFmcy0x
LjkuMS1kb2MudGFyLmJ6MgojIGNhdCAvcHJvYy9mcy9mc2NhY2hlL3N0YXRzCkZTLUNhY2hlIHN0
YXRpc3RpY3MKQ29va2llczogbj0xIHY9MSB2Y29sPTAgdm9vbT0wCkFjcXVpcmU6IG49MiBvaz0y
IG9vbT0wCkxSVSAgICA6IG49MSBleHA9MSBybXY9MCBkcnA9MCBhdD02NzEwCkludmFscyA6IG49
MApVcGRhdGVzOiBuPTIgcnN6PTAgcnNuPTAKUmVsaW5xczogbj0xIHJ0cj0wIGRyb3A9MQpOb1Nw
YWNlOiBud3I9MCBuY3I9MCBjdWxsPTAKSU8gICAgIDogcmQ9MTYgd3I9MTYKUmRIZWxwIDogUkE9
MzIgUlA9MCBXQj0wIFdCWj0wIHJyPTAgc3I9MApSZEhlbHAgOiBaUj0xIHNoPTAgc2s9MApSZEhl
bHAgOiBETD0xNiBkcz0xNiBkZj0wIGRpPTAKUmRIZWxwIDogUkQ9MTYgcnM9MTYgcmY9MApSZEhl
bHAgOiBXUj0xNiB3cz0xNiB3Zj0wCiMgdW5hbWUgLXIKNi40LjAtcmMxCgotLQpMaW51eC1jYWNo
ZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

