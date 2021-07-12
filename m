Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A853B3C5F9E
	for <lists+linux-cachefs@lfdr.de>; Mon, 12 Jul 2021 17:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626104667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vwj636gATfoHHhZzl8n2EMFnA81I+22j2x/xp0F6yEY=;
	b=T8RIrsd54eoiV5HbmMlL3bwtaZe70Ehc/qlX7D5mOcMxGYCV22Vqa/+CGDMQyMuPPuoQKT
	OIwtDx02Qw5aPhah+lyilcTvjAHc9l3tCFhkEARRBJXRkYwety3ANiygJxGt4e6IPE5qLC
	ESIleA0RgEY5uQ8h7AnmYd5mIordrps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-qFM68oobOBGNGllGeAVJ8w-1; Mon, 12 Jul 2021 11:44:26 -0400
X-MC-Unique: qFM68oobOBGNGllGeAVJ8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AA4885EE97;
	Mon, 12 Jul 2021 15:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 535665C1D1;
	Mon, 12 Jul 2021 15:44:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5ABD61809C99;
	Mon, 12 Jul 2021 15:44:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16CFhsN6013616 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 12 Jul 2021 11:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D04C110429F9; Mon, 12 Jul 2021 15:43:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-19.rdu2.redhat.com
	[10.10.118.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F175A1042A43;
	Mon, 12 Jul 2021 15:43:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
MIME-Version: 1.0
Date: Mon, 12 Jul 2021 16:43:29 +0100
Message-ID: <3398985.1626104609@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] Request for folios
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3398984.1626104609.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andrew,

Is it possible to get Willy's folios patchset - or at least the core of it -
staged for the next merge window?  I'm working on improvements to the local
filesystem caching code and the network filesystem support library and that
involves a lot of dealing with pages - all of which will need to be converted
to the folios stuff.  This has the potential to conflict with the changes
Willy's patches make to filesystems.  Further, the folios patchset offers some
facilities that make my changes a bit easier - and some changes that make
things a bit more challenging (e.g. page size becoming variable).

Also, is it possible to get the folios patchset in a stable public git branch
that I can base my patches upon?

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

