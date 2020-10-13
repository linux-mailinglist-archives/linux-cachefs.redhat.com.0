Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3364E28D53D
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Oct 2020 22:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602619991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OsTyEfx+W/fxP77G9zO9qfw7ZbfM/4LkcXF7lAytuy0=;
	b=B5pZaxGHE8cFFgyDPc5JHmoqTZLI/yedu3bAqu9MLRw/aFNhq4UeU98vI9/CrFy/vPHFNm
	mIr+wTZapaY+lOdC9rg6s958/jrNQpDFpgY45QRUmNfYY3tVgQq67RX2UQnsPNBesB1w6h
	xSQlsU+aX5doX3EIzSbhtijTMEE2r24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-fEMgSJ_iMKa_h9KFSVLOGQ-1; Tue, 13 Oct 2020 16:13:09 -0400
X-MC-Unique: fEMgSJ_iMKa_h9KFSVLOGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FE771015CB3;
	Tue, 13 Oct 2020 20:13:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468775D9CD;
	Tue, 13 Oct 2020 20:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00E1A1826D36;
	Tue, 13 Oct 2020 20:13:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DKCwII032456 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 16:12:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C25AD27CC6; Tue, 13 Oct 2020 20:12:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-70.rdu2.redhat.com
	[10.10.120.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAE3C27CCC;
	Tue, 13 Oct 2020 20:12:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <000000000000e32a8b05b01f808a@google.com>
References: <000000000000e32a8b05b01f808a@google.com>
To: syzbot <syzbot+2d0585e5efcd43d113c2@syzkaller.appspotmail.com>
MIME-Version: 1.0
Date: Tue, 13 Oct 2020 21:12:54 +0100
Message-ID: <157941.1602619974@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09DKCwII032456
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] KASAN: use-after-free Read in
	fscache_alloc_cookie
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <157940.1602619974.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git f8eb8d1c6a853f617ca9ee233bb2d230401c5bdc

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

