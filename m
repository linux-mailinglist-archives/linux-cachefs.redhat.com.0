Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFA5C331A3A
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 23:33:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-LaniOB3PNImq9bzPproJTg-1; Mon, 08 Mar 2021 17:33:06 -0500
X-MC-Unique: LaniOB3PNImq9bzPproJTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 041041B18BC6;
	Mon,  8 Mar 2021 22:33:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 702AC1A864;
	Mon,  8 Mar 2021 22:33:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7C834EA32;
	Mon,  8 Mar 2021 22:33:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128MWxm5024006 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 17:32:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3E3651111A41; Mon,  8 Mar 2021 22:32:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39CFE1111A44
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 22:32:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6745480A1D1
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 22:32:56 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-386-31_DgudQMAavsjLas_UnDg-1; Mon, 08 Mar 2021 17:32:52 -0500
X-MC-Unique: 31_DgudQMAavsjLas_UnDg-1
Received: from dread.disaster.area (pa49-181-239-12.pa.nsw.optusnet.com.au
	[49.181.239.12])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 3A2521041A91;
	Tue,  9 Mar 2021 09:32:48 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1lJOQh-000IZX-At; Tue, 09 Mar 2021 09:32:47 +1100
Date: Tue, 9 Mar 2021 09:32:47 +1100
From: Dave Chinner <david@fromorbit.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210308223247.GB63242@dread.disaster.area>
References: <CAOQ4uxjYWprb7trvamCx+DaP2yn8HCaZeZx1dSvPyFH2My303w@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<517184.1615194835@warthog.procyon.org.uk>
	<584529.1615202921@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <584529.1615202921@warthog.procyon.org.uk>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=gO82wUwQTSpaJfP49aMSow==:117 a=gO82wUwQTSpaJfP49aMSow==:17
	a=kj9zAlcOel0A:10 a=dESyimp9J3IA:10 a=pGLkceISAAAA:8 a=07d9gI8wAAAA:8
	a=7-415B0cAAAA:8 a=fLlyUv8SAob-akP86owA:9 a=CjuIK1q_8ugA:10
	a=e2CUPOnPG4QKp8I52DXD:22 a=biEYGPWJfzWAr4FL6Ov7:22
	a=BPzZvq435JnGatEyYwdK:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	"J. Bruce Fields" <bfields@fieldses.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 08, 2021 at 11:28:41AM +0000, David Howells wrote:
> Amir Goldstein <amir73il@gmail.com> wrote:
> 
> > > But after I've written and sync'd the data, I set the xattr to mark the
> > > file not open.  At the moment I'm doing this too lazily, only doing it
> > > when a netfs file gets evicted or when the cache gets withdrawn, but I
> > > really need to add a queue of objects to be sealed as they're closed.  The
> > > balance is working out how often to do the sealing as something like a
> > > shell script can do a lot of consecutive open/write/close ops.
> > 
> > You could add an internal vfs API wait_for_multiple_inodes_to_be_synced().
> > For example, xfs keeps the "LSN" on each inode, so once the transaction
> > with some LSN has been committed, all the relevant inodes, if not dirty, can
> > be declared as synced, without having to call fsync() on any file and without
> > having to force transaction commit or any IO at all.
> > 
> > Since fscache takes care of submitting the IO, and it shouldn't care about any
> > specific time that the data/metadata hits the disk(?), you can make use of the
> > existing periodic writeback and rolling transaction commit and only ever need
> > to wait for that to happen before marking cache files "closed".
> > 
> > There was a discussion about fsyncing a range of files on LSFMM [1].
> > In the last comment on the article dchinner argues why we already have that
> > API (and now also with io_uring(), but AFAIK, we do not have a useful
> > wait_for_sync() API. And it doesn't need to be exposed to userspace at all.
> > 
> > [1] https://lwn.net/Articles/789024/
> 
> This sounds like an interesting idea.  Actually, what I probably want is a
> notification to say that a particular object has been completely sync'd to
> disk, metadata and all.

This isn't hard to do yourself in the kernel. All it takes is a
workqueue to run vfs_fsync() calls asynchronously and for the work
to queue a local notification/wakeup when the fsync completes...

That's all aio_fsync() does - the notification it queues on
completion is the AIO completion event for userspace - so I think
you could do this in about 50 lines of code if you really needed
it...

> However, there are some performance problems are arising in my fscache-iter
> branch:
> 
>  (1) It's doing a lot of synchronous metadata operations (tmpfile, truncate,
>      setxattr).

Async pipelines using unbound workqueues are your friend.
> 
>  (2) It's retaining a lot of open file structs on cache files.  Cachefiles
>      opens the file when it's first asked to access it and retains that till
>      the cookie is relinquished or the cache withdrawn (the file* doesn't
>      contribute to ENFILE/EMFILE but it still eats memory).

Sounds similar to the problem that the NFSd open file cache solves.
(fs/nfsd/filecache.c)

>  (3) Trimming excess data from the end of the cache file.  The problem with
>      using DIO to write to the cache is that the write has to be rounded up to
>      a multiple of the backing fs DIO blocksize,

Actually, a multiple of the logical sector size of the backing
device behind the backing filesystem.

>      but if the file is truncated
>      larger, that excess data now becomes part of the file.

Keep the actual file size in your tracking xattr.

>      Possibly it's sufficient to just clear the excess page space before
>      writing, but that doesn't necessarily stop a writable mmap from
>      scribbling on it.

We can't stop mmap from scribbling in it. All filesystems have this
problem, so to prevent data leaks we have to zero the post-eof tail
region on every write of the EOF block, anyway.

>  (4) Committing outstanding cache metadata at cache withdrawal or netfs
>      unmount.  I've previously mentioned this: it ends up with a whole slew of
>      synchronous metadata changes being committed to the cache in one go
>      (truncates, fallocates, fsync, xattrs, unlink+link of tmpfile) - and this
>      can take quite a long time.  The cache needs to be more proactive in
>      getting stuff committed as it goes along.

Workqueues give you an easy mechanism for async dispatch and
concurrency for synchronous operations. This is a largely solved
problem...

>  (5) Attaching to an object requires a pathwalk to it (normally only two
>      steps) and then reading various xattrs on it - all synchronous, but can
>      be punted to a background threadpool.

a.k.a. punting to a workqueue :)

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

