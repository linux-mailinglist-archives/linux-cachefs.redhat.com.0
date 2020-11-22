Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 462792BC30D
	for <lists+linux-cachefs@lfdr.de>; Sun, 22 Nov 2020 02:56:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-r1RgYcH8OhW5FB774I3WMg-1; Sat, 21 Nov 2020 20:56:09 -0500
X-MC-Unique: r1RgYcH8OhW5FB774I3WMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50EDE51D5;
	Sun, 22 Nov 2020 01:56:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C117310016F5;
	Sun, 22 Nov 2020 01:56:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E93F4A7C6;
	Sun, 22 Nov 2020 01:56:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AM1txDL023091 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 21 Nov 2020 20:55:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F4DE2026D11; Sun, 22 Nov 2020 01:55:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4E52026D76
	for <linux-cachefs@redhat.com>; Sun, 22 Nov 2020 01:55:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBA4B1035FE4
	for <linux-cachefs@redhat.com>; Sun, 22 Nov 2020 01:55:56 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-4-zMIaG1kZMPadnru2BBM_6Q-1;
	Sat, 21 Nov 2020 20:55:54 -0500
X-MC-Unique: zMIaG1kZMPadnru2BBM_6Q-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 2F05B139CA27;
	Sun, 22 Nov 2020 01:55:52 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T1ZL0CZIe0M5; Sun, 22 Nov 2020 01:55:52 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 1115D139AE13;
	Sun, 22 Nov 2020 01:55:52 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 00FF98157437;
	Sun, 22 Nov 2020 01:55:52 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xdYNyvzCm7tI; Sun, 22 Nov 2020 01:55:51 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id D8252815743A;
	Sun, 22 Nov 2020 01:55:51 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Z9y5VpeJQ9xI; Sun, 22 Nov 2020 01:55:51 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 9666B8157437;
	Sun, 22 Nov 2020 01:55:51 +0000 (GMT)
Date: Sun, 22 Nov 2020 01:55:50 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <1480128642.91427046.1606010150674.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201122000216.GE3476@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<20201117152636.GC4556@fieldses.org>
	<725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
	<20201120223831.GB7705@fieldses.org>
	<20201120224438.GC7705@fieldses.org>
	<5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
	<1758069641.91412432.1605995069116.JavaMail.zimbra@dneg.com>
	<20201122000216.GE3476@fieldses.org>
MIME-Version: 1.0
Thread-Topic: nfsd: pre/post attr is using wrong change attribute
Thread-Index: tRxeNdT08Q5kqHGP2s+VopzNe3y5pA==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AM1txDL023091
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 2/4] nfsd: pre/post attr is using wrong
	change attribute
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Ci0tLS0tIE9uIDIyIE5vdiwgMjAyMCwgYXQgMDA6MDIsIGJmaWVsZHMgYmZpZWxkc0BmaWVsZHNl
cy5vcmcgd3JvdGU6Cj4+IEkgc2hvdWxkIGFsc28gbWVudGlvbiB0aGF0IEkgc3RpbGwgc2VlIGEg
bG90IG9mIHVuZXhwZWN0ZWQgcmVwZWF0Cj4+IGxvb2t1cHMgZXZlbiB3aXRoIHRoZSBpdmVyc2lv
biBvcHRpbWlzYXRpb24gcGF0Y2hlcyB3aXRoIGNlcnRhaW4KPj4gd29ya2xvYWRzLiBGb3IgZXhh
bXBsZSwgbG9va2luZyBhdCBhIG5ldHdvcmsgY2FwdHVyZSBvbiB0aGUgcmUtZXhwb3J0Cj4+IHNl
cnZlciBJIG1pZ2h0IHNlZSAxMDBzIG9mIGdldGF0dHIgY2FsbHMgdG8gdGhlIG9yaWdpbmF0aW5n
IHNlcnZlciBmb3IKPj4gdGhlIHNhbWUgZmlsZWhhbmRsZSB3aXRoaW4gMzAgc2Vjb25kcyB3aGlj
aCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlCj4+IGNsaWVudCBjYWNoZSB0byBzZXJ2ZS4gQnV0
IGl0IGNvdWxkIGFsc28gYmUgdGhhdCB0aGUgY2xpZW50IGNhY2hlIGlzCj4+IHVuZGVyIG1lbW9y
eSBwcmVzc3VyZSBhbmQgbm90IGhvbGRpbmcgdGhhdCBkYXRhIGZvciB2ZXJ5IGxvbmcuCj4gCj4g
VGhhdCBzb3VuZHMgd2VpcmQuICBJcyB0aGUgZmlsZWhhbmRsZSBmb3IgYSBmaWxlIG9yIGEgZGly
ZWN0b3J5PyAgSXMgdGhlCj4gZmlsZSBvciBkaXJlY3RvcnkgYWN0dWFsbHkgY2hhbmdpbmcgYXQg
dGhlIHRpbWUsIGFuZCBpZiBzbywgaXMgaXQgdGhlCj4gY2xpZW50IHRoYXQncyBjaGFuZ2luZyBp
dD8KPiAKPiBSZW1pbmQgbWUgd2hhdCB0aGUgc2V0dXAgaXMtLWEgdjMgcmUtZXhwb3J0IG9mIGEg
djQgbW91bnQ/CgpNYXliZSB0aGlzIGRpc2N1c3Npb24gc2hvdWxkIGdvIGJhY2sgaW50byB0aGUg
IkFkdmVudmV0dXJlcyBpbiByZS1leHBvcnRpbmciIHRocmVhZD8gQnV0IHRvIGdpdmUgYSBxdWlj
ayBhbnN3ZXIgaGVyZSBhbnl3YXkuLi4KClRoZSB3b3JrbG9hZCBJIGhhdmUgYmVlbiBsb29raW5n
IGF0IHJlY2VudGx5IGlzIGEgTkZTdjMgcmUtZXhwb3J0IG9mIGEgTkZTdjQuMiBtb3VudC4gSSBj
YW4gYWxzbyBzYXkgdGhhdCBpdCBpcyBnZW5lcmFsbHkgd2hlbiBuZXcgZmlsZXMgYXJlIGJlaW5n
IHdyaXR0ZW4gdG8gYSBkaXJlY3RvcnkuIFNvIHllcywgdGhlIGZpbGVzIGFuZCBkaXIgYXJlIGNo
YW5naW5nIGF0IHRoZSB0aW1lIGJ1dCBJIHN0aWxsIGRpZG4ndCBleHBlY3QgdG8gc2VlIHNvIG1h
bnkgcmVwZWF0ZWQgZ2V0YXR0ciBuZWF0bHkgYnVuZGxlZCB0b2dldGhlciBpbiBzaG9ydCBidXJz
dHMsIGUuZy4gKHJlLWV4cG9ydCBzZXJ2ZXIgPSAxMC4xNTYuMTIuMSwgb3JpZ2luYXRpbmcgc2Vy
dmVyIDEwLjIxLjIyLjExNykuCgo1NDU0NCAgODguMTQ3OTI3ICAxMC4xNTYuMTIuMSDihpIgMTAu
MjEuMjIuMTE3IE5GUyAzMjYgVjQgQ2FsbCBTRVRBVFRSIEZIOiAweDRkYmRmYjAxCjU0NTQ3ICA4
OC4xNjA0NjkgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDM1MCBWNCBDYWxsIFNF
VEFUVFIgRkg6IDB4NGRiZGZiMDEKNTQ1NTYgIDg4LjE4NTU5MiAgMTAuMTU2LjEyLjEg4oaSIDEw
LjIxLjIyLjExNyBORlMgMzMwIFY0IENhbGwgU0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo1NDU1OSAg
ODguMTk4MzUwICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAzNTAgVjQgQ2FsbCBT
RVRBVFRSIEZIOiAweDRkYmRmYjAxCjU0NTYyICA4OC4yMTE2NzAgIDEwLjE1Ni4xMi4xIOKGkiAx
MC4yMS4yMi4xMTcgTkZTIDMyNiBWNCBDYWxsIFNFVEFUVFIgRkg6IDB4NGRiZGZiMDEKNTQ1NjUg
IDg4LjI0MzI1MSAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMzUwIFY0IENhbGwg
T1BFTiBESDogMHg0ZGJkZmIwMS8KNTQ2MzcgIDg4LjI2OTU4NyAgMTAuMTU2LjEyLjEg4oaSIDEw
LjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo1NTA3OCAg
ODguMjc3MTM4ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBD
T01NSVQgRkg6IDB4NGRiZGZiMDEgT2Zmc2V0OiAwIExlbjogMAo1Nzc0NyAgODguMzkwMTk3ICAx
MC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAw
eDRkYmRmYjAxCjU3NzQ4ICA4OC4zOTAyMTIgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcg
TkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4NGRiZGZiMDEKNTc3NDkgIDg4LjM5MDIxNSAg
MTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDog
MHg0ZGJkZmIwMQo1Nzc1MCAgODguMzkwMjE4ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3
IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCjU3NzUxICA4OC4zOTAyMjAg
IDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6
IDB4NGRiZGZiMDEKNTc3NTIgIDg4LjM5MDIyMiAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjEx
NyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo1Nzc1MyAgODguMzkwMjMx
ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZI
OiAweDRkYmRmYjAxCjU3NzU0ICA4OC4zOTAyNjEgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4x
MTcgTkZTIDI4MiBWNCBDYWxsIENPTU1JVCBGSDogMHg0ZGJkZmIwMSBPZmZzZXQ6IDAgTGVuOiAw
CjU3NzU1ICA4OC4zOTAyOTIgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBW
NCBDYWxsIEdFVEFUVFIgRkg6IDB4NGRiZGZiMDEKNTc4NTIgIDg4LjQxNTU0MSAgMTAuMTU2LjEy
LjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgQ09NTUlUIEZIOiAweDRkYmRmYjAx
IE9mZnNldDogMCBMZW46IDAKNTc4NTMgIDg4LjQxNTU1MSAgMTAuMTU2LjEyLjEg4oaSIDEwLjIx
LjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo1ODk2NSAgODgu
NDQyMDA0ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRB
VFRSIEZIOiAweDRkYmRmYjAxCjYwMjAxICA4OC40ODYyMzEgIDEwLjE1Ni4xMi4xIOKGkiAxMC4y
MS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4NGRiZGZiMDEKNjA2MTUgIDg4
LjUwNTQ1MyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VU
QVRUUiBGSDogMHg0ZGJkZmIwMQo2MDYxNiAgODguNTA1NDczICAxMC4xNTYuMTIuMSDihpIgMTAu
MjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweDRkYmRmYjAxCjYwNjE3ICA4
OC41MDU0NzcgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdF
VEFUVFIgRkg6IDB4NGRiZGZiMDEKNjA2MTggIDg4LjUwNTQ4MCAgMTAuMTU2LjEyLjEg4oaSIDEw
LjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHg0ZGJkZmIwMQo2MDYxOSAg
ODguNTA1NDgyICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBD
T01NSVQgRkg6IDB4NGRiZGZiMDEgT2Zmc2V0OiAwIExlbjogMAoKT2Z0ZW4gSSBvbmx5IGNhcHR1
cmUgYW4gb3BlbiBkaCBmb2xsb3dlZCBieSBhIGZsdXJyeSBvZiBnZXRhdHRyOgoKIDMwNjggIDI0
LjYwMzE1MyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMzUwIFY0IENhbGwgT1BF
TiBESDogMHhiNjNhOThlYy8KIDMwODkgIDI0LjY0MTU0MiAgMTAuMTU2LjEyLjEg4oaSIDEwLjIx
LjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwogMzA5MyAgMjQu
NjQyMTcyICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRB
VFRSIEZIOiAweGI2M2E5OGVjCiAzMTQwICAyNC43MTk5MzAgIDEwLjE1Ni4xMi4xIOKGkiAxMC4y
MS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKIDMzNjAgIDI0
Ljc2OTQyMyAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VU
QVRUUiBGSDogMHhiNjNhOThlYwogMzM3NiAgMjQuNzcxMzUzICAxMC4xNTYuMTIuMSDihpIgMTAu
MjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCiAzNDM2ICAy
NC43ODI4MTcgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdF
VEFUVFIgRkg6IDB4YjYzYTk4ZWMKIDM1NjkgIDI0Ljc5ODIwNyAgMTAuMTU2LjEyLjEg4oaSIDEw
LjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwogMzc1MyAg
MjQuODU1MjMzICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBH
RVRBVFRSIEZIOiAweGI2M2E5OGVjCiAzNzc3ICAyNC44NTYxMzAgIDEwLjE1Ni4xMi4xIOKGkiAx
MC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKIDM4MjQg
IDI0Ljg2MjkxOSAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwg
R0VUQVRUUiBGSDogMHhiNjNhOThlYwogMzg3MyAgMjQuODczODkwICAxMC4xNTYuMTIuMSDihpIg
MTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCiA0MDAx
ICAyNC44OTgyODkgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxs
IEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKIDQwNzAgIDI0LjkyNTk3MCAgMTAuMTU2LjEyLjEg4oaS
IDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENhbGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwogNDEy
NyAgMjQuOTQwNjE2ICAxMC4xNTYuMTIuMSDihpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2Fs
bCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCiA0MTc0ICAyNC45ODUxNjAgIDEwLjE1Ni4xMi4xIOKG
kiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBDYWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKIDQz
NDMgIDI1LjAwNzU2NSAgMTAuMTU2LjEyLjEg4oaSIDEwLjIxLjIyLjExNyBORlMgMjgyIFY0IENh
bGwgR0VUQVRUUiBGSDogMHhiNjNhOThlYwogNDM0NCAgMjUuMDA4MzQzICAxMC4xNTYuMTIuMSDi
hpIgMTAuMjEuMjIuMTE3IE5GUyAyODIgVjQgQ2FsbCBHRVRBVFRSIEZIOiAweGI2M2E5OGVjCiA0
MzU4ICAyNS4wMzYxNzcgIDEwLjE1Ni4xMi4xIOKGkiAxMC4yMS4yMi4xMTcgTkZTIDI4MiBWNCBD
YWxsIEdFVEFUVFIgRkg6IDB4YjYzYTk4ZWMKClRoZSBjb21tb24gd29ya2xvYWQgaXMgdGhhdCB3
ZSB3aWxsIGhhdmUgbXVsdGlwbGUgY2xpZW50cyBvZiB0aGUgcmUtZXhwb3J0IHNlcnZlciBhbGwg
d3JpdGluZyBkaWZmZXJlbnQgKGZyYW1lKSBmaWxlcyBpbnRvIHRoZSBzYW1lIGRpcmVjdG9yeSBh
dCB0aGUgc2FtZSB0aW1lLiBCdXQgb24gdGhlIHJlLWV4cG9ydCBzZXJ2ZXIgaXQgaXMgdWx0aW1h
dGVseSAxNiB0aHJlYWRzIG9mIG5mc2QgbWFraW5nIHRob3NlIGNhbGxzIHRvIHRoZSBvcmlnaW5h
dGluZyBzZXJ2ZXIuCgpUaGUgcmUtZXhwb3J0IHNlcnZlcidzIGNsaWVudCBzaG91bGQgYmUgdGhl
IG9ubHkgb25lIG1ha2luZyBtb3N0IG9mIHRoZSBjaGFuZ2VzLCBhbHRob3VnaCB0aGVyZSBhcmUg
b3RoZXIgTkZTdjMgY2xpZW50cyBvZiB0aGUgb3JpZ2luYXRpbmcgc2VydmVycyB0aGF0IGNvdWxk
IGNvbmNlaXZhYmx5IGJlIHVwZGF0aW5nIGZpbGVzIHRvby4KCkxpa2UgSSBzYWlkLCBpdCBtaWdo
dCBiZSBpbnRlcmVzdGluZyB0byBzZWUgaWYgd2Ugc2VlIHRoZSBzYW1lIGJlaGF2aW91ciB3aXRo
IGEgTkZTdjMgcmUtZXhwb3J0IG9mIGFuIE5GU3YzIHNlcnZlci4KCkRhaXJlCgoKLS0KTGludXgt
Y2FjaGVmcyBtYWlsaW5nIGxpc3QKTGludXgtY2FjaGVmc0ByZWRoYXQuY29tCmh0dHBzOi8vd3d3
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZz

