Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E51D131CA3A
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Feb 2021 12:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613476552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c3AQzRsbyWk+/RuiU7lhd1uyCDl1yK2rtLFor1pH5NY=;
	b=Q7c6rYLmG4CRyQ/cxirkEGYxmGuE1RM2D1hzEpISvVCII86Cw/N5MSAkYJbC7Rf3ow7Mbx
	iXT0iNjBOF6+eaBrYaVtL5ENDrKYiOZ1HGv1Cgflo+Aif+9ju6Z8IqaV76ozOW+2xvGrG3
	F2tRAhJJlrHWjeza5OYVtz4T0QW5T4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-9Iv4jHy9Pb2BPL4HHwlarw-1; Tue, 16 Feb 2021 06:55:50 -0500
X-MC-Unique: 9Iv4jHy9Pb2BPL4HHwlarw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6E4F8030C2;
	Tue, 16 Feb 2021 11:55:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75CA85D765;
	Tue, 16 Feb 2021 11:55:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE59718095CB;
	Tue, 16 Feb 2021 11:55:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GBtgdq029179 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 06:55:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72E1C10023B0; Tue, 16 Feb 2021 11:55:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1466410016FA;
	Tue, 16 Feb 2021 11:55:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210216102614.GA27555@lst.de>
References: <20210216102614.GA27555@lst.de>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340390150.1303470.509630287091953754.stgit@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 11:55:35 +0000
Message-ID: <1429650.1613476535@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 04/33] vfs: Export rw_verify_area() for
	use by cachefiles
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1429649.1613476535.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@lst.de> wrote:

> > Export rw_verify_area() for so that cachefiles can use it before issuing
> > call_read_iter() and call_write_iter() to effect async DIO operations
> > against the cache.  This is analogous to aio_read() and aio_write().
> 
> I don't think this is the right thing to do.  Instead of calling
> into ->read_iter / ->write_iter directly this should be using helpers.
> 
> What prevents you from using vfs_iocb_iter_read and
> vfs_iocb_iter_write which seem the right level of abstraction for this?

I don't think they existed when I wrote this code.  Should aio use that too,
btw?  I modelled my code on aio_read() and aio_write().

But I can certainly switch to using vfs_iocb_iter_read/write, though the
trivial checks are redundant.  The fsnotify call, I guess I'm missing though
(and is that missing in aio_read/write() also?).

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

