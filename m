Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B692330C51
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 12:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615202937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q8NWZsgVdf00nE6F37g2aNTkPrWe5yhtffYZUZkRYwA=;
	b=d5LSHF44JpuMu8YCWkdWYM3N8Ht6JLwTJMtcpGtyPSV17Suvz+fA+VM5sFzOoeo+Ki9LIY
	rOW/kN8J0EWxd3+qnLIspqbyqDQ18XlJyX/P76BWFgqV9/iXL7/F6dxHN+LMxHBm90ksOY
	8+psGtNtch0bCXqQcawIiPFJIIpQv9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-HK42xyz0PS26HLB7MwqxAg-1; Mon, 08 Mar 2021 06:28:55 -0500
X-MC-Unique: HK42xyz0PS26HLB7MwqxAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1331D10866A6;
	Mon,  8 Mar 2021 11:28:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B251A60C04;
	Mon,  8 Mar 2021 11:28:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 010F457DC0;
	Mon,  8 Mar 2021 11:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128BSnBn020440 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 06:28:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EAB3062A24; Mon,  8 Mar 2021 11:28:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-79.rdu2.redhat.com
	[10.10.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF3E5D756;
	Mon,  8 Mar 2021 11:28:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAOQ4uxjYWprb7trvamCx+DaP2yn8HCaZeZx1dSvPyFH2My303w@mail.gmail.com>
References: <CAOQ4uxjYWprb7trvamCx+DaP2yn8HCaZeZx1dSvPyFH2My303w@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<517184.1615194835@warthog.procyon.org.uk>
To: Amir Goldstein <amir73il@gmail.com>
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 11:28:41 +0000
Message-ID: <584529.1615202921@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 128BSnBn020440
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, CIFS <linux-cifs@vger.kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: [Linux-cachefs] Metadata writtenback notification? -- was Re:
	fscache: Redesigning the on-disk cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <584528.1615202921.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Amir Goldstein <amir73il@gmail.com> wrote:

> > But after I've written and sync'd the data, I set the xattr to mark the
> > file not open.  At the moment I'm doing this too lazily, only doing it
> > when a netfs file gets evicted or when the cache gets withdrawn, but I
> > really need to add a queue of objects to be sealed as they're closed.  The
> > balance is working out how often to do the sealing as something like a
> > shell script can do a lot of consecutive open/write/close ops.
> 
> You could add an internal vfs API wait_for_multiple_inodes_to_be_synced().
> For example, xfs keeps the "LSN" on each inode, so once the transaction
> with some LSN has been committed, all the relevant inodes, if not dirty, can
> be declared as synced, without having to call fsync() on any file and without
> having to force transaction commit or any IO at all.
> 
> Since fscache takes care of submitting the IO, and it shouldn't care about any
> specific time that the data/metadata hits the disk(?), you can make use of the
> existing periodic writeback and rolling transaction commit and only ever need
> to wait for that to happen before marking cache files "closed".
> 
> There was a discussion about fsyncing a range of files on LSFMM [1].
> In the last comment on the article dchinner argues why we already have that
> API (and now also with io_uring(), but AFAIK, we do not have a useful
> wait_for_sync() API. And it doesn't need to be exposed to userspace at all.
> 
> [1] https://lwn.net/Articles/789024/

This sounds like an interesting idea.  Actually, what I probably want is a
notification to say that a particular object has been completely sync'd to
disk, metadata and all.

I'm not sure that io_uring is particularly usable from within the kernel,
though.

> If I were you, I would try to avoid re-implementing a journaled filesystem or
> a database for fscache and try to make use of crash consistency guarantees
> that filesystems already provide.
> Namely, use the data dependency already provided by temp files.
> It doesn't need to be one temp file per cached file.
> 
> Always easier said than done ;-)

Yes.

There are a number of considerations I have to deal with, and they're somewhat
at odds with each other:

 (1) I need to record what data I have stored from a file.

 (2) I need to record where I stored the data.

 (3) I need to make sure that I don't see old data.

 (4) I need to make sure that I don't see data in the wrong file.

 (5) I need to make sure I lose as little as possible on a crash.

 (6) I want to be able to record what changes were made in the event we're
     disconnected from the server.

For my fscache-iter branch, (1) is done with a map in an xattr, but I only
cache up to 1G in a file at the moment; (2), (4) and, to some extent (5), are
handled by the backing fs; (3) is handled by tagging the file and storing
coherency data in in an xattr (though tmpfiles are used on full invalidation).
(6) is not yet supported.

For upstream, (1), (2), (4) and to some extent (5) are handled through the
backing fs.  (3) is handled by storing coherency data in an xattr and
truncating the file on invalidation; (6) is not yet supported.

However, there are some performance problems are arising in my fscache-iter
branch:

 (1) It's doing a lot of synchronous metadata operations (tmpfile, truncate,
     setxattr).

 (2) It's retaining a lot of open file structs on cache files.  Cachefiles
     opens the file when it's first asked to access it and retains that till
     the cookie is relinquished or the cache withdrawn (the file* doesn't
     contribute to ENFILE/EMFILE but it still eats memory).

     I can mitigate this by closing much sooner, perhaps opening the file for
     each operation - but at the cost of having to spend time doing more opens
     and closes.  What's in upstream gets away without having to do open/close
     for reads because it calls readpage.

     Alternatively, I can have a background file closer - which requires an
     LRU queue.  This could be combined with a file "sealer".

     Deferred writeback on the netfs starting writes to the cache makes this
     more interesting as I have to retain the interest on the cache object
     beyond the netfs file being closed.

 (3) Trimming excess data from the end of the cache file.  The problem with
     using DIO to write to the cache is that the write has to be rounded up to
     a multiple of the backing fs DIO blocksize, but if the file is truncated
     larger, that excess data now becomes part of the file.

     Possibly it's sufficient to just clear the excess page space before
     writing, but that doesn't necessarily stop a writable mmap from
     scribbling on it.

 (4) Committing outstanding cache metadata at cache withdrawal or netfs
     unmount.  I've previously mentioned this: it ends up with a whole slew of
     synchronous metadata changes being committed to the cache in one go
     (truncates, fallocates, fsync, xattrs, unlink+link of tmpfile) - and this
     can take quite a long time.  The cache needs to be more proactive in
     getting stuff committed as it goes along.

 (5) Attaching to an object requires a pathwalk to it (normally only two
     steps) and then reading various xattrs on it - all synchronous, but can
     be punted to a background threadpool.

Amongst the reasons I was considering moving to an index and a single datafile
is to replace the path-lookup step for each object and the xattr reads to
looking in a single file and to reduce the number of open files in the cache
at any one time to around four.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

