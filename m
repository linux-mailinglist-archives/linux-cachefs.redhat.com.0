Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C061744555C
	for <lists+linux-cachefs@lfdr.de>; Thu,  4 Nov 2021 15:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636036370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aHMAdSLQbJSW/7sy0bpS6m/XLrDb3rq7AbPT1KYLsaw=;
	b=GB/u58pA3I2uiW0/FNz5KaGoBi+5sp5RSltStfVhckHdVKFV1SbJkZDiNCATItpmOLAdI3
	8bLh4qhsF7jeL9bNGhAUMwkr/GLnyzE5g+M5A9MmYUmRUCHHbGbPDy6Z/GuOZ1IZJwhMpU
	J7EMAuf3QsmRBPaKW0JnxmmkFi0iKl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-nngm25URNuuxl2tQ3-PGTg-1; Thu, 04 Nov 2021 10:32:47 -0400
X-MC-Unique: nngm25URNuuxl2tQ3-PGTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03E4F80EFBD;
	Thu,  4 Nov 2021 14:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E475D9DE;
	Thu,  4 Nov 2021 14:32:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FA4E1806D03;
	Thu,  4 Nov 2021 14:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4EWZDa016159 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 10:32:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5660C56A96; Thu,  4 Nov 2021 14:32:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22BD856A94;
	Thu,  4 Nov 2021 14:32:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YYK4YKCnDyoJx5eW@casper.infradead.org>
References: <YYK4YKCnDyoJx5eW@casper.infradead.org>
	<YYKa3bfQZxK5/wDN@casper.infradead.org>
	<163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
	<163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk>
	<1038257.1635951492@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 04 Nov 2021 14:32:18 +0000
Message-ID: <1760415.1636036338@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A4EWZDa016159
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [PATCH v3 5/6] netfs, 9p, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1760414.1636036338.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Wed, Nov 03, 2021 at 02:58:12PM +0000, David Howells wrote:
> > Matthew Wilcox <willy@infradead.org> wrote:
> > 
> > > > +	len = (size >= start + gran) ? gran : size - start;
> > > 
> > > This seems like the most complicated way to write this ... how about:
> > > 
> > >         size_t len = min_t(loff_t, isize - start, folio_size(folio));
> > 
> > I was trying to hedge against isize-start going negative.  Can this code race
> > against truncate?  truncate_setsize() changes i_size *before* invalidating the
> > pages.
> 
> We should check for isize < start separately, and skip the writeback
> entirely.

So, something like the following

	static int v9fs_vfs_write_folio_locked(struct folio *folio)
	{
		struct inode *inode = folio_inode(folio);
		struct v9fs_inode *v9inode = V9FS_I(inode);
		loff_t start = folio_pos(folio);
		loff_t i_size = i_size_read(inode);
		struct iov_iter from;
		size_t len = folio_size(folio);
		int err;

		if (start >= i_size)
			return 0; /* Simultaneous truncation occurred */

		len = min_t(loff_t, i_size - start, len);

		iov_iter_xarray(&from, ..., start, len);
		...
	}

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

