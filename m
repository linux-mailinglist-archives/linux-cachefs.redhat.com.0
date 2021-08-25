Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 452313F76D7
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Aug 2021 16:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629900364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LEYM6BdeQvHHm3TQ2Lx2jeT23N/TZECy13JyaGFKSU0=;
	b=WiqC4Ej3iRWGR0r52SyFW60DUBTBt/Iu7Q0qGnUjSwkJy0Kil9NDn5MFYe5OMKq4haJqiB
	QdvgrvVcM7jLfsV3yJm0wu/ZrhRtsqKq10zkwV3iUKoWEIDTVFiGZaKjrXBlR8I4reMsah
	H0wuw4gQeSRa2OTj1io2Mr5xkAN1Bz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-n9MEWBWhOne5G07kTvi6QA-1; Wed, 25 Aug 2021 10:06:03 -0400
X-MC-Unique: n9MEWBWhOne5G07kTvi6QA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB40F94DC6;
	Wed, 25 Aug 2021 14:06:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A49EA2C00F;
	Wed, 25 Aug 2021 14:06:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BD2E4BB7C;
	Wed, 25 Aug 2021 14:05:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17PE5ukf021319 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Aug 2021 10:05:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3222560C13; Wed, 25 Aug 2021 14:05:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A820060C04;
	Wed, 25 Aug 2021 14:05:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <6370d0a74c3ceb79c53305a64ba7a982d16d34b4.camel@redhat.com>
References: <6370d0a74c3ceb79c53305a64ba7a982d16d34b4.camel@redhat.com>
	<162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
	<162431203107.2908479.3259582550347000088.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@redhat.com>
MIME-Version: 1.0
Date: Wed, 25 Aug 2021 15:05:51 +0100
Message-ID: <2030919.1629900351@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 11/12] fscache: Fix fscache_cookie_put()
	to not deref after dec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2030918.1629900351.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@redhat.com> wrote:

> > fscache_cookie_put() accesses the cookie it has just put inside the
> > tracepoint that monitors the change - but this is something it's not
> > allowed to do if we didn't reduce the count to zero.
> 
> Do you mean "if the count went to zero." ?

No.  If *we* reduced the count to zero, it falls to us to destroy the object,
so we're allowed to look into it again.

If we didn't reduce the count to zero, then someone else might destroy it
before we look into it again.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

