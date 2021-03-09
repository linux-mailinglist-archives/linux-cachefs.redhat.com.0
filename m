Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7C4332403
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Mar 2021 12:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615289302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+hFnWU8O02WB9q+mnPfQvDedTRF4kJlsh6t5wX/QeCE=;
	b=hSIkri87/p+BW5Fib+09cPBuykrlkkTDRcJpOW7OP7h/Xydg4L5zJfexPDH+FizH47+XLL
	5N2uNRhhNZAoX/zkHgBzUNxKxnpOPEMOD7cEES1/Lp47dCj3kslVog6S0ULTJ397ry1g2N
	d0tspHNz0wwBuRGb0rPk8DOU068ncqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-hCRnu55TPJm84uYNpiPHUQ-1; Tue, 09 Mar 2021 06:28:21 -0500
X-MC-Unique: hCRnu55TPJm84uYNpiPHUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BD761019634;
	Tue,  9 Mar 2021 11:28:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B815860C4A;
	Tue,  9 Mar 2021 11:28:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 123E41809C86;
	Tue,  9 Mar 2021 11:28:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 129BSAai032093 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Mar 2021 06:28:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7D84829406; Tue,  9 Mar 2021 11:28:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 542A75D9CD;
	Tue,  9 Mar 2021 11:27:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210308223247.GB63242@dread.disaster.area>
References: <20210308223247.GB63242@dread.disaster.area>
	<CAOQ4uxjYWprb7trvamCx+DaP2yn8HCaZeZx1dSvPyFH2My303w@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<517184.1615194835@warthog.procyon.org.uk>
	<584529.1615202921@warthog.procyon.org.uk>
To: Dave Chinner <david@fromorbit.com>
MIME-Version: 1.0
Date: Tue, 09 Mar 2021 11:27:54 +0000
Message-ID: <156605.1615289274@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 129BSAai032093
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, CIFS <linux-cifs@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] Metadata writtenback notification? -- was Re:
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
Content-ID: <156604.1615289274.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Chinner <david@fromorbit.com> wrote:

> > > There was a discussion about fsyncing a range of files on LSFMM [1].
> > > In the last comment on the article dchinner argues why we already have that
> > > API (and now also with io_uring(), but AFAIK, we do not have a useful
> > > wait_for_sync() API. And it doesn't need to be exposed to userspace at all.
> > > 
> > > [1] https://lwn.net/Articles/789024/
> > 
> > This sounds like an interesting idea.  Actually, what I probably want is a
> > notification to say that a particular object has been completely sync'd to
> > disk, metadata and all.
> 
> This isn't hard to do yourself in the kernel. All it takes is a
> workqueue to run vfs_fsync() calls asynchronously and for the work
> to queue a local notification/wakeup when the fsync completes...
> 
> That's all aio_fsync() does - the notification it queues on
> completion is the AIO completion event for userspace - so I think
> you could do this in about 50 lines of code if you really needed
> it...

I was thinking more in terms of passively finding out when metadata has been
flushed to disk rather than actively forcing it.  Obviously I can manually
flush from a worker thread, but that ties up a thread per file I want to
flush (unless I want to do a higher-level sync).

Btw, looking at aio_fsync(), is there any reason it copies the current creds
rather than just taking a ref on them?  (Granted, this may not be a question
for you)

> > However, there are some performance problems are arising in my fscache-iter
> > branch:
> > 
> >  (1) It's doing a lot of synchronous metadata operations (tmpfile, truncate,
> >      setxattr).
> 
> Async pipelines using unbound workqueues are your friend.

Maybe.  I could just throw everything into a workqueue and let the workqueue
deal with it.  There still have to be synchronisation points, though - I can't
schedule a cache-write from a server-read to the cache following a 3rd-party
induced invalidation until after the invalidation has happened - and that
holds up userspace from writing to the cache.  But maybe it will work.

Btw, how expensive is it to throw an operation off to a workqueue versus doing
it in thread?  Particularly if it's a synchronous op that the thread is going
to have to wait for (e.g. write_begin()).

> >  (2) It's retaining a lot of open file structs on cache files.  Cachefiles
> >      opens the file when it's first asked to access it and retains that till
> >      the cookie is relinquished or the cache withdrawn (the file* doesn't
> >      contribute to ENFILE/EMFILE but it still eats memory).
> 
> Sounds similar to the problem that the NFSd open file cache solves.
> (fs/nfsd/filecache.c)

Looks similiarish to what I was thinking of with having a queue of
currently-not-in-use cookies to go through and commit and close.

> >      but if the file is truncated
> >      larger, that excess data now becomes part of the file.
> 
> Keep the actual file size in your tracking xattr.

I do that, but it doesn't help entirely.  If someone truncates the file larger
and then writes non-contiguously, the problem occurs.

I've tried truncating the file down and then truncating it up, but that
requires two synchronous ops - though the latter is relatively cheap.  I've
also tried fallocate() to clear the block.  What I've found is that the next
DIO write then has to sync because these may read data into the pagecache of
the backing file.

Apart from clearing the tail of a page on writing, it might be better for me
to read the data into a spare page, clear the tail and write it back.

> >      Possibly it's sufficient to just clear the excess page space before
> >      writing, but that doesn't necessarily stop a writable mmap from
> >      scribbling on it.
> 
> We can't stop mmap from scribbling in it. All filesystems have this
> problem, so to prevent data leaks we have to zero the post-eof tail
> region on every write of the EOF block, anyway.

I meant an mmap scribbling on it after it's been cleared - but I guess taking
away the PTE-writeable flag and making page_mkwrite() wait should solve that.

> >  (4) Committing outstanding cache metadata at cache withdrawal or netfs
> >      unmount.  I've previously mentioned this: it ends up with a whole
> >      slew of synchronous metadata changes being committed to the cache in
> >      one go (truncates, fallocates, fsync, xattrs, unlink+link of tmpfile)
> >      - and this can take quite a long time.  The cache needs to be more
> >      proactive in getting stuff committed as it goes along.
> 
> Workqueues give you an easy mechanism for async dispatch and
> concurrency for synchronous operations. This is a largely solved
> problem...

Yes and no.  Yes, I can fan out the number of threads doing the committing,
but there's still a limit on the I/O bandwidth - and a lot of the operations
still have to hit the disk in the right order.  It still stuffs up the user
experience if the cache eats up the entirety of the disk I/O for a few seconds
just because an automount expired.

Probably the progressive committing approach is a better one so that there's
less to do at the end.

> >  (5) Attaching to an object requires a pathwalk to it (normally only two
> >      steps) and then reading various xattrs on it - all synchronous, but can
> >      be punted to a background threadpool.
> 
> a.k.a. punting to a workqueue :)

I do that, but it doesn't help so much.  Whilst it can mitigate the effect by
running parallel to userspace, userspace tends to move pretty quickly from
open() to read() - at which point we have to wait anyway.

The problem is that all the steps are synchronous and, for the most part, have
to be sequential because there's a dependency chain: 2 x dir-lookup, get LSM
xattrs, get cache xattrs - then read the data if it's present.  I might be
able to speculate at the end and read two cache xattrs in parallel, but each
one requires a separate thread to do it.

On top of that, if the user is running a parallel application such as building
a kernel, a CPU running an offloaded I/O thread isn't running a user thread.
What I've found is that increasing the size of the threadpool doesn't actually
affect the time taken.

What I've done in my fscache-iter branch is to have a small thread pool and
offload work to it if there's a thread free - otherwise process the work in
the calling userspace thread and avoid the context switching.


One reason I was wondering about moving to an approach whereby I have an index
that locates all the blocks (which are then kept in a single file) is that I
can probably keep the entire index in RAM and so the lookup costs are vastly
reduced.  The downside as Amir pointed out is that metadata coherency is much
harder if I don't just want to blow the cache away if cache isn't properly
committed when the machine is rebooted.

Note that OpenAFS has been using a single-index approach, with each 256K block
of data in its own file.  They then zap any file that's newer than the index
file when the cache is started, assuming that that file might be corrupted.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

