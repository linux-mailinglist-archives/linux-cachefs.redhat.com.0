Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9759C2B7E35
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 Nov 2020 14:20:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-c1x-_UlsPpScBAY0cWV50g-1; Wed, 18 Nov 2020 08:20:45 -0500
X-MC-Unique: c1x-_UlsPpScBAY0cWV50g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CFFC1075624;
	Wed, 18 Nov 2020 13:20:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48C3D5D707;
	Wed, 18 Nov 2020 13:20:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0048B183D021;
	Wed, 18 Nov 2020 13:20:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AICuD5V027631 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 07:56:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 80496B3013; Wed, 18 Nov 2020 12:56:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7905DB3012
	for <linux-cachefs@redhat.com>; Wed, 18 Nov 2020 12:56:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF8D18007D9
	for <linux-cachefs@redhat.com>; Wed, 18 Nov 2020 12:56:09 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-295-v8MOfNvJNf6aoGX1oIvw2Q-1; Wed, 18 Nov 2020 07:56:07 -0500
X-MC-Unique: v8MOfNvJNf6aoGX1oIvw2Q-1
Received: by nautica.notk.org (Postfix, from userid 1001)
	id 9480DC009; Wed, 18 Nov 2020 13:48:41 +0100 (CET)
Date: Wed, 18 Nov 2020 13:48:26 +0100
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20201118124826.GA17850@nautica>
References: <1514086.1605697347@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1514086.1605697347@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH] 9p: Convert to new fscache API
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells wrote on Wed, Nov 18, 2020:
> Here's a rough draft of a patch to convert 9P to use the rewritten fscache
> API.  It compiles, but I've no way to test it.  This is built on top of my
> fscache-iter branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter

Thanks, I'm ashamed I hadn't found time to work on this it's a great
help.
I can get some test running with this.

What's the current schedule/plan for the fscache branch merging? Will
you be trying this merge window next month?

Couple more questions below

> Notes:
> 
>  (*) I've switched to use ITER_XATTR rather than ITER_BVEC in some places.
> 
>  (*) I've added a pair of helper functions to get the cookie:
> 
> 	v9fs_inode_cookie()
> 	v9fs_session_cache()
> 
>      These return NULL if CONFIG_9P_FSCACHE=n.
> 
>  (*) I've moved some of the fscache accesses inline.  Using the above helper
>      functions, it all compiles away due to NULL pointer checks in the header
>      file if fscache is disabled.
> 
>  (*) 9P's readpage and readpages now just jump into the netfs helpers, as does
>      write_begin.  v9fs_req_issue_op() initiates the I/O on behalf of the
>      helpers.
> 
>  (*) v9fs_write_begin() now returns the subpage and v9fs_write_end() goes back
>      out to the head page.  thp_size() is also used.  This should mean you
>      handle transparent huge pages (THPs) and can turn that on.
> 
>  (*) I have made an assumption that 9p_client_read() and write can handle I/Os
>      larger than a page.  If this is not the case, v9fs_req_ops will need
>      clamp_length() implementing.

There's a max driven by the client's msize (client->msize - P9_IOHDRSZ ;
unfortunately msize is just guaranted to be >= 4k so that means the
actual IO size would be smaller in that case even if that's not intended
to be common)

>  (*) The expand_readahead() and clamp_length() ops should perhaps be
>      implemented to align and trim with respect to maximum I/O size.
> 
>  (*) iget and evict acquire and relinquish a cookie.
> 
>  (*) open and release use and unuse that cookie.
> 
>  (*) writepage writes the dirty data to the cache.
> 
>  (*) setattr resizes the cache if necessary.
> 
>  (*) The cache needs to be invalidated if a 3rd-party change happens, but I
>      haven't done that.

There's no concurrent access logic in 9p as far as I'm aware (like NFS
does if the mtime changes for example), so I assume we can keep ignoring
this.

>  (*) With these changes, 9p should cache local changes too, not just data
>      read.
> 
>  (*) If 9p supports DIO writes, it should invalidate a cache object with
>      FSCACHE_INVAL_DIO_WRITE when one happens - thereby stopping caching for
>      that file until all file handles on it are closed.

Not 100% sure actually there is some code about it but comment says it's
disabled when cache is active; I'll check just found another problem
with some queued patch that need fixing first...

> I forgot something: netfs_subreq_terminated() needs to be called when
> the read is complete.  If p9_client_read() is synchronous, then that
> would be here,

(it is synchronous; I'll add that suggestion)

-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

