Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB1031CCA1
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Feb 2021 16:09:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613488190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CwziE5RxTYM3VsYhGboLu3vbftxZ6sP4V2+QZRg5kMY=;
	b=HkmFp23WklYkrSpxt/qYB5I5iOpbXaTJvFHf5EVSYDwz3MndGLMrRBR86R/P/of3v8fguc
	b1UyzMBVZWHhERUwR9tkoEsZChcnpB0n1ZlD+31YlkzqO+BfTSZeDaupRr+xOz3LsV3ZA+
	BZTIKEZumm/h0WsVA7eM2fjYf3haap4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365--3707vkoOCaEPnsnoRhUGA-1; Tue, 16 Feb 2021 10:09:48 -0500
X-MC-Unique: -3707vkoOCaEPnsnoRhUGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CACC835E23;
	Tue, 16 Feb 2021 15:09:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C445D74C;
	Tue, 16 Feb 2021 15:09:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BF6558075;
	Tue, 16 Feb 2021 15:09:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GF8DRL023165 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 10:08:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E42131A38C; Tue, 16 Feb 2021 15:08:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5855219D6C;
	Tue, 16 Feb 2021 15:08:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210216104914.GA28196@lst.de>
References: <20210216104914.GA28196@lst.de>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340402057.1303470.8038373593844486698.stgit@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 15:08:06 +0000
Message-ID: <1444259.1613488086@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11GF8DRL023165
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 14/33] fscache,
	cachefiles: Add alternate API to use kiocb for read/write to cache
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
Content-ID: <1444258.1613488086.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@lst.de> wrote:

> > Filesystems wanting to use the new API must #define FSCACHE_USE_NEW_IO_API
> > before #including the header
> 
> What exactly does this ifdef buys us?  It seems like the old and new
> APIs don't even conflict.

I was asked to add this.  The APIs look like they don't conflict, but you
can't mix them for a given file because of the differing behaviour of the
PG_fscache flag.  It also makes it much easier to make sure you don't miss
something.  That has happened and it led to some strange effects before we
worked out what was going on.

> And if we really need an ifdef I'd rather use that for the old code to make
> grepping for that easier.

I can do it that way - but this doesn't require changing filesystems that
aren't being changed.  The intent would be to eliminate the #ifdef in a cycle
or two anyway.

Besides, there are 5 filesystems that use this, and two of them are converted
here.  grep would only return three hits: one each in fs/9p/cache.h,
fs/cifs/fscache.h and fs/nfs/fscache.h.

OTOH, I suppose it might dissuade people from adding new usages of the old
API.

> > +	if (ki->term_func) {
> > +		if (ret < 0)
> > +			ki->term_func(ki->term_func_priv, ret);
> > +		else
> > +			ki->term_func(ki->term_func_priv, ki->skipped + ret);
> 
> Why not simplify:
> 
> 		if (ret > 0)
> 			ret += ki->skipped;
> 		ki->term_func(ki->term_func_priv, ret);

Could do that I suppose.  The optimiser will make them the same anyway.

I still wonder if I should do something with ret2 as obtained from the kiocb
completion function:

  static void cachefiles_read_complete(struct kiocb *iocb, long ret, long ret2)

Can we consolidate to one return value?

> > +	/* If the caller asked us to seek for data before doing the read, then
> > +	 * we should do that now.  If we find a gap, we fill it with zeros.
> > +	 */
> 
> FYI, this is not the normal kernel comment style..

I've been following the network style.

> > +	ret = rw_verify_area(READ, file, &ki->iocb.ki_pos, len - skipped);
> > +	if (ret < 0)
> > +		goto presubmission_error_free;
> > +
> > +	get_file(ki->iocb.ki_filp);
> > +
> > +	old_nofs = memalloc_nofs_save();
> > +	ret = call_read_iter(file, &ki->iocb, iter);
> > +	memalloc_nofs_restore(old_nofs);
> 
> As mentioned before I think all this magic belongs in to a helper
> in the VFS.

You suggested vfs_iocb_iter_read() in your reply to another patch, but it
occurs to me that that doesn't have memalloc_nofs_*() in it.  I could hoist
the memalloc_nofs stuff out and use those helpers.

> > +static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
> > +	.end_operation		= cachefiles_end_operation,
> > +	.read			= cachefiles_read,
> > +	.write			= cachefiles_write,
> > +	.expand_readahead	= NULL,
> > +	.prepare_read		= cachefiles_prepare_read,
> > +};
> ...
> Also at least in linux-next ->read and ->write seem to never actually
> be called.

See netfs_read_from_cache() and netfs_rreq_do_write_to_cache() in
fs/netfs/read_helper.c.  Look for "cres->ops->".

> > +{
> > +	struct cachefiles_object *object;
> > +	struct cachefiles_cache *cache;
> > +	struct path path;
> > +	struct file *file;
> > +
> > +	_enter("");
> > +
> > +	object = container_of(op->op.object,
> > +			      struct cachefiles_object, fscache);
> > +	cache = container_of(object->fscache.cache,
> > +			     struct cachefiles_cache, cache);
> > +
> > +	path.mnt = cache->mnt;
> > +	path.dentry = object->backer;
> > +	file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE | O_DIRECT,
> > +				   d_inode(object->backer), cache->cache_cred);
> 
> I think this should be plain old dentry_open?

open_with_fake_path() sets FMODE_NOACCOUNT.  In the fscache-iter branch, the
file is held open a lot longer and then ENFILE/EMFILE starts being a serious
problem.

That said, I'm considering changing things so that all the data in the cache
is held in one or a few files with an index to locate things - at which point
this issue goes away.

> > +	op = fscache_alloc_retrieval(cookie, NULL, NULL, NULL);
> > +	if (!op)
> > +		return -ENOMEM;
> > +	//atomic_set(&op->n_pages, 1);
> 
> ???

I should remove that - it kind of got left behind.  That was necessary for the
old API, but a whole load of this code, including the fscache_retrieval struct
will be going away when the cookie and operation handling get rewritten.

> > +{
> > +	if (fscache_cookie_valid(cookie) && fscache_cookie_enabled(cookie))
> > +		return __fscache_begin_read_operation(rreq, cookie);
> > +	else
> > +		return -ENOBUFS;
> > +}
> 
> No need for an else after a return.  I personally also prefer to always
> handle the error case first, ala:

It's not precisely an error case, more a "fallback required" case.

>         if (!fscache_cookie_valid(cookie) || !fscache_cookie_enabled(cookie))
> 	                return -ENOBUFS;
> 	return __fscache_begin_read_operation(rreq, cookie);
> 
> Also do we really need this inline fast path to start with?

Yes.  fscache might be compiled out, in which case we'll never go down the
slow path.  And the common case is that cookie == NULL, so let's not jump out
of line if we don't have to.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

