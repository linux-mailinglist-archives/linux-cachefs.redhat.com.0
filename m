Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DBD7831C90D
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Feb 2021 11:49:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-7E9nOH5TPd6-fUpco-CywA-1; Tue, 16 Feb 2021 05:49:32 -0500
X-MC-Unique: 7E9nOH5TPd6-fUpco-CywA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF2B01005501;
	Tue, 16 Feb 2021 10:49:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827C2710DB;
	Tue, 16 Feb 2021 10:49:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15B3C57DFA;
	Tue, 16 Feb 2021 10:49:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GAnPQ7022199 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 05:49:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C8F2D20CA489; Tue, 16 Feb 2021 10:49:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C307A20CA48A
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 10:49:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81B38801207
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 10:49:23 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-37-vA0XPZL1N-qy6nOLQXigmA-1;
	Tue, 16 Feb 2021 05:49:18 -0500
X-MC-Unique: vA0XPZL1N-qy6nOLQXigmA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id D58946736F; Tue, 16 Feb 2021 11:49:14 +0100 (CET)
Date: Tue, 16 Feb 2021 11:49:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210216104914.GA28196@lst.de>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340402057.1303470.8038373593844486698.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161340402057.1303470.8038373593844486698.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 15, 2021 at 03:47:00PM +0000, David Howells wrote:
> Add an alternate API by which the cache can be accessed through a kiocb,
> doing async DIO, rather than using the current API that tells the cache
> where all the pages are.
> 
> The new API is intended to be used in conjunction with the netfs helper
> library.  A filesystem must pick one or the other and not mix them.
> 
> Filesystems wanting to use the new API must #define FSCACHE_USE_NEW_IO_API
> before #including the header

What exactly does this ifdef buys us?  It seems like the old and new
APIs don't even conflict.  And if we really need an ifdef I'd rather
use that for the old code to make grepping for that easier.

> +extern void cachefiles_put_object(struct fscache_object *_object,
> +				  enum fscache_obj_ref_trace why);

No need for the extern here on all the other function prototypes.

> +	if (ki->term_func) {
> +		if (ret < 0)
> +			ki->term_func(ki->term_func_priv, ret);
> +		else
> +			ki->term_func(ki->term_func_priv, ki->skipped + ret);

Why not simplify:

		if (ret > 0)
			ret += ki->skipped;
		ki->term_func(ki->term_func_priv, ret);

> +	/* If the caller asked us to seek for data before doing the read, then
> +	 * we should do that now.  If we find a gap, we fill it with zeros.
> +	 */

FYI, this is not the normal kernel comment style..

> +	ret = rw_verify_area(READ, file, &ki->iocb.ki_pos, len - skipped);
> +	if (ret < 0)
> +		goto presubmission_error_free;
> +
> +	get_file(ki->iocb.ki_filp);
> +
> +	old_nofs = memalloc_nofs_save();
> +	ret = call_read_iter(file, &ki->iocb, iter);
> +	memalloc_nofs_restore(old_nofs);

As mentioned before I think all this magic belongs in to a helper
in the VFS.

> +static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
> +	.end_operation		= cachefiles_end_operation,
> +	.read			= cachefiles_read,
> +	.write			= cachefiles_write,
> +	.expand_readahead	= NULL,
> +	.prepare_read		= cachefiles_prepare_read,
> +};

No need to set any member in a static allocated structure to zero.

Also at least in linux-next ->read and ->write seem to never actually
be called.

> +{
> +	struct cachefiles_object *object;
> +	struct cachefiles_cache *cache;
> +	struct path path;
> +	struct file *file;
> +
> +	_enter("");
> +
> +	object = container_of(op->op.object,
> +			      struct cachefiles_object, fscache);
> +	cache = container_of(object->fscache.cache,
> +			     struct cachefiles_cache, cache);
> +
> +	path.mnt = cache->mnt;
> +	path.dentry = object->backer;
> +	file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE | O_DIRECT,
> +				   d_inode(object->backer), cache->cache_cred);

I think this should be plain old dentry_open?

> +extern struct fscache_retrieval *fscache_alloc_retrieval(struct fscache_cookie *,
> +							 struct address_space *,
> +							 fscache_rw_complete_t, void *);

No need for the extern.  And no need to indent the parameters totally out
sight, a single tab should be enough.  And it's always nice to spell out
the parameter names.

> +	op = fscache_alloc_retrieval(cookie, NULL, NULL, NULL);
> +	if (!op)
> +		return -ENOMEM;
> +	//atomic_set(&op->n_pages, 1);

???

> +static inline
> +int fscache_begin_read_operation(struct netfs_read_request *rreq,

Normal kernel style is to have the static and the inline on the
same line as the return type.

> +				 struct fscache_cookie *cookie)
> +{
> +	if (fscache_cookie_valid(cookie) && fscache_cookie_enabled(cookie))
> +		return __fscache_begin_read_operation(rreq, cookie);
> +	else
> +		return -ENOBUFS;
> +}

No need for an else after a return.  I personally also prefer to always
handle the error case first, ala:

        if (!fscache_cookie_valid(cookie) || !fscache_cookie_enabled(cookie))
	                return -ENOBUFS;
	return __fscache_begin_read_operation(rreq, cookie);

Also do we really need this inline fast path to start with?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

