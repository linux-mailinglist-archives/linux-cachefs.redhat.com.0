Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AECB44440E
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Nov 2021 15:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635951526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AL9IY74oYJRnxP59ECBpq+cOMRbtq82t5C8FbTb1tVQ=;
	b=Ax/8zt/YpKrJXRZKc6lt838NJGCuO05snIbWVmXTwmNRk8lZ4LCbQINV06uz7sN+XvA+H2
	Q1eFGYKcIlWvxG/bqsqEyBGo/Bwt9sY8zbSlRlssBN6CsjqhMEW8UTX0pgfKseF68BsUe9
	lNvgANLYI8N8uwnP7bWIJ1NwY/W9km8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-r0Y3pTvfPp-xOD5PS4UTSA-1; Wed, 03 Nov 2021 10:58:43 -0400
X-MC-Unique: r0Y3pTvfPp-xOD5PS4UTSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69FAB87511E;
	Wed,  3 Nov 2021 14:58:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA75795A3;
	Wed,  3 Nov 2021 14:58:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 276344A703;
	Wed,  3 Nov 2021 14:58:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3EwSIW003427 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 10:58:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C51AA7880; Wed,  3 Nov 2021 14:58:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C887D69FA2;
	Wed,  3 Nov 2021 14:58:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YYKa3bfQZxK5/wDN@casper.infradead.org>
References: <YYKa3bfQZxK5/wDN@casper.infradead.org>
	<163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
	<163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Wed, 03 Nov 2021 14:58:12 +0000
Message-ID: <1038257.1635951492@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1038256.1635951492.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > +	len = (size >= start + gran) ? gran : size - start;
> 
> This seems like the most complicated way to write this ... how about:
> 
>         size_t len = min_t(loff_t, isize - start, folio_size(folio));

I was trying to hedge against isize-start going negative.  Can this code race
against truncate?  truncate_setsize() changes i_size *before* invalidating the
pages.

> >  static int afs_symlink_readpage(struct file *file, struct page *page)
> >  {
> > -	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
> > +	struct afs_vnode *vnode = AFS_FS_I(page_mapping(page)->host);
> 
> How does swap end up calling readpage on a symlink?

Um - readpage is called to read the symlink.

> > -	page_endio(page, false, ret);
> > +	page_endio(&folio->page, false, ret);
> 
> We need a folio_endio() ...

I think we mentioned this before and I think you said you had or would make a
patch for it.  I can just create a wrapper for it if that'll do.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

