Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 02B921E4AC1
	for <lists+linux-cachefs@lfdr.de>; Wed, 27 May 2020 18:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590598019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K3fAocxHczqINBRxozzjwbpmRZleOGyCq8Pr/6cgeZw=;
	b=PlKqeSvG1pLULPijiMwHf/LfK2Na0OkMbmZOj0bHeqA+//dJQIhynodyQSd8dGY6+epMGq
	RmBUxoe6XRUSwVrX2+Ky29/kSoEBDIn9XYzodKJpk9ufzP8LZi4MYy3gLx+sR9dqFXNXyI
	KvqNcM0R+evVmnRtER2BGT6feXEUi1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-BgWvOkiYNNW1NRuXtKhBog-1; Wed, 27 May 2020 12:46:57 -0400
X-MC-Unique: BgWvOkiYNNW1NRuXtKhBog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06AB019067E3;
	Wed, 27 May 2020 16:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F236E5D9E5;
	Wed, 27 May 2020 16:46:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 231E86B4D5;
	Wed, 27 May 2020 16:46:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RGkjPO029497 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 12:46:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B17183C06; Wed, 27 May 2020 16:46:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
	[10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BECBA1020;
	Wed, 27 May 2020 16:46:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <10a52dff816fb300e459bd320890d32d@hardeman.nu>
References: <10a52dff816fb300e459bd320890d32d@hardeman.nu>
To: =?us-ascii?Q?=3D=3Futf-8=3FB=3FRGF2aWQgSMOkcmRlbWFu=3F=3D?=
	<david@hardeman.nu>
MIME-Version: 1.0
Date: Wed, 27 May 2020 17:46:40 +0100
Message-ID: <3878424.1590598000@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04RGkjPO029497
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] cachefilesd refuses to cache NFS exports/mounts
	with fsid = 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGF2aWQgSMOkcmRlbWFuIDxkYXZpZEBoYXJkZW1hbi5udT4gd3JvdGU6Cgo+IEkndmUgYmVlbiB0
cnlpbmcgdG8gc2V0dXAgZnNjYWNoZSBmb3IgYW4gTkZTIHNoYXJlIGJ5IGZvbGxvd2luZyB2YXJp
b3VzIG9ubGluZSBndWlkZXMgYnV0IHRoZSBjbGllbnQgcmVmdXNlZCB0byBlbmFibGUgdGhlIEZT
QyBmb3Igc29tZSByZWFzb24gKGNsaWVudCA9IERlYmlhbiBVbnN0YWJsZSwgTGludXggNS42LjA7
IHNlcnZlciA9IERlYmlhbiBTdGFibGUsIExpbnV4IDQuMTkuMC04KS4KPiAKPiBBZnRlciBhIGxv
dCBvZiB0cmlhbCBhbmQgZXJyb3IsIEkgZGlzY292ZXJlZCB0aGF0IHRoZSBjYWNoaW5nIGlzIGVu
YWJsZWQgYXMgbG9uZyBhcyB0aGUgZnNpZCBpcyBub3QgemVyby4KPiAKPiBJcyB0aGlzIGV4cGVj
dGVkIGJlaGF2aW9yIGFuZCwgaWYgc28sIHNob3VsZG4ndCBpdCBiZSBkb2N1bWVudGVkIHNvbWV3
aGVyZT8KClNvbWUgcGF0Y2hlcyB3ZW50IGluIHRvIHY1LjctcmM2IHRoYXQgbWF5IHdlbGwgZml4
IHRoaXMuCgo1MGVhYTY1MmI1NGQgTkZTdjQ6IEZpeCBmc2NhY2hlIGNvb2tpZSBhdXhfZGF0YSB0
byBlbnN1cmUgY2hhbmdlX2F0dHIgaXMgaW5jbHVkZWQKMTU3NTE2MTI3MzRjIE5GUzogRml4IGZz
Y2FjaGUgc3VwZXJfY29va2llIGFsbG9jYXRpb24KZDliZmNlZDFmYmNiIE5GUzogRml4IGZzY2Fj
aGUgc3VwZXJfY29va2llIGluZGV4X2tleSBmcm9tIGNoYW5naW5nIGFmdGVyIHVtb3VudAoKCkRh
dmlkCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnM=

