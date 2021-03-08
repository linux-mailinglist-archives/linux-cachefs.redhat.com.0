Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DD4FB330B50
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 11:35:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-Aa3CpFxtO0-LQPo5naIE-g-1; Mon, 08 Mar 2021 05:35:53 -0500
X-MC-Unique: Aa3CpFxtO0-LQPo5naIE-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAF181005D4A;
	Mon,  8 Mar 2021 10:35:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3D75D9D3;
	Mon,  8 Mar 2021 10:35:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B9F01809C86;
	Mon,  8 Mar 2021 10:35:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128AZknp015253 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 05:35:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E0E02166BD9; Mon,  8 Mar 2021 10:35:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 868E12166BA3
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 10:35:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E089985A5B5
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 10:35:43 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-503-o6Q3bf_jO1mMjheD2nmaow-1; Mon, 08 Mar 2021 05:35:39 -0500
X-MC-Unique: o6Q3bf_jO1mMjheD2nmaow-1
Received: by mail-il1-f178.google.com with SMTP id e7so8352358ile.7;
	Mon, 08 Mar 2021 02:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uW22BUdu/SRB8yiALOfrH1UfupHMNVrmOHvwUHBy06I=;
	b=c67UcRIchHKEK+ttmUhwgjOCDpKk80/y0inruBNvx1VrBdoAQQyBvregQA6HkjCR1+
	obya8S4WW/HQqJ2O/ke5WlICuMDekCosLxzoz2/m4qWInfL7cHFyABfuhaRFTKU3nt7s
	bVcYkC92QhQBoG2+yw1ltz5P3OJ9d/3iPUNMn9CU/KGb9UvtbQNOtnv99uAYJLcQd21t
	E6+xkrgzE2qpElDdxUq46DbNwUGBodiJczr0JBB7GFIwlxxQBIzYbtu2Pg9pvnfVHTLD
	fnJqr5O8KYICSDgDakGq5cDTFudX+/QUcfpS3YkVbYXZjxVveJ+HSfIk36fh1AwW9uIm
	FKRQ==
X-Gm-Message-State: AOAM531zWw8alq+ZHrCqSoESgvwlfBVnBqyvbCeCdNGIhw6yfw8IjF41
	wswfDbMrw2bk16FeMCNlt/mv+3jESJpq/kCcpjNulX4rXn0=
X-Google-Smtp-Source: ABdhPJxyjk22aaxo3sgf/QuqQ+LLIuxfb1TXrgGa/WsZBq/b3dbCGqGi/0c5jlTKv2ACVTB9EU8+B0z9poenvesX45o=
X-Received: by 2002:a92:c010:: with SMTP id q16mr20835009ild.250.1615199738508;
	Mon, 08 Mar 2021 02:35:38 -0800 (PST)
MIME-Version: 1.0
References: <2653261.1614813611@warthog.procyon.org.uk>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<517184.1615194835@warthog.procyon.org.uk>
In-Reply-To: <517184.1615194835@warthog.procyon.org.uk>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 8 Mar 2021 12:35:27 +0200
Message-ID: <CAOQ4uxjYWprb7trvamCx+DaP2yn8HCaZeZx1dSvPyFH2My303w@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Christoph Hellwig <hch@infradead.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	"J. Bruce Fields" <bfields@fieldses.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] fscache: Redesigning the on-disk cache
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 8, 2021 at 11:14 AM David Howells <dhowells@redhat.com> wrote:
>
> Amir Goldstein <amir73il@gmail.com> wrote:
>
> > >  (0a) As (0) but using SEEK_DATA/SEEK_HOLE instead of bmap and opening the
> > >       file for every whole operation (which may combine reads and writes).
> >
> > I read that NFSv4 supports hole punching, so when using ->bmap() or SEEK_DATA
> > to keep track of present data, it's hard to distinguish between an
> > invalid cached range and a valid "cached hole".
>
> I wasn't exactly intending to permit caching over NFS.  That leads to fun
> making sure that the superblock you're caching isn't the one that has the
> cache in it.
>
> However, we will need to handle hole-punching being done on a cached netfs,
> even if that's just to completely invalidate the cache for that file.
>
> > With ->fiemap() you can at least make the distinction between a non existing
> > and an UNWRITTEN extent.
>
> I can't use that for XFS, Ext4 or btrfs, I suspect.  Christoph and Dave's
> assertion is that the cache can't rely on the backing filesystem's metadata
> because these can arbitrarily insert or remove blocks of zeros to bridge or
> split extents.
>
> > You didn't say much about crash consistency or durability requirements of the
> > cache. Since cachefiles only syncs the cache on shutdown, I guess you
> > rely on the hosting filesystem to provide the required ordering guarantees.
>
> There's an xattr on each file in the cache to record the state.  I use this
> mark a cache file "open".  If, when I look up a file, the file is marked open,
> it is just discarded at the moment.
>
> Now, there are two types of data stored in the cache: data that has to be
> stored as a single complete blob and is replaced as such (e.g. symlinks and
> AFS dirs) and data that might be randomly modified (e.g. regular files).
>
> For the former, I have code, though in yet another branch, that writes this in
> a tmpfile, sets the xattrs and then uses vfs_link(LINK_REPLACE) to cut over.
>
> For the latter, that's harder to do as it would require copying the data to
> the tmpfile before we're allowed to modify it.  However, if it's possible to
> create a tmpfile that's a CoW version of a data file, I could go down that
> route.
>
> But after I've written and sync'd the data, I set the xattr to mark the file
> not open.  At the moment I'm doing this too lazily, only doing it when a netfs
> file gets evicted or when the cache gets withdrawn, but I really need to add a
> queue of objects to be sealed as they're closed.  The balance is working out
> how often to do the sealing as something like a shell script can do a lot of
> consecutive open/write/close ops.
>

You could add an internal vfs API wait_for_multiple_inodes_to_be_synced().
For example, xfs keeps the "LSN" on each inode, so once the transaction
with some LSN has been committed, all the relevant inodes, if not dirty, can
be declared as synced, without having to call fsync() on any file and without
having to force transaction commit or any IO at all.

Since fscache takes care of submitting the IO, and it shouldn't care about any
specific time that the data/metadata hits the disk(?), you can make use of the
existing periodic writeback and rolling transaction commit and only ever need
to wait for that to happen before marking cache files "closed".

There was a discussion about fsyncing a range of files on LSFMM [1].
In the last comment on the article dchinner argues why we already have that
API (and now also with io_uring(), but AFAIK, we do not have a useful
wait_for_sync() API. And it doesn't need to be exposed to userspace at all.

[1] https://lwn.net/Articles/789024/

> > Anyway, how are those ordering requirements going to be handled when entire
> > indexing is in a file? You'd practically need to re-implement a filesystem
>
> Yes, the though has occurred to me too.  I would be implementing a "simple"
> filesystem - and we have lots of those:-/.  The most obvious solution is to
> use the backing filesystem's metadata - except that that's not possible.
>
> > journal or only write cache updates to a temp file that can be discarded at
> > any time?
>
> It might involve keeping a bitmap of "open" blocks.  Those blocks get
> invalidated when the cache restarts.  The simplest solution would be to wipe
> the entire cache in such a situation, but that goes against one of the
> important features I want out of it.
>
> Actually, a journal of open and closed blocks might be better, though all I
> really need to store for each block is a 32-bit number.
>
> It's a particular problem if I'm doing DIO to the data storage area but
> buffering the changes to the metadata.  Further, the metadata and data might
> be on different media, just to add to the complexity.
>
> Another possibility is only to cull blocks when the parent file is culled.
> That probably makes more sense as, as long as the file is registered culled on
> disk first and I don't reuse the file slot too quickly, I can write to the
> data store before updating the metadata.
>

If I were you, I would try to avoid re-implementing a journaled filesystem or
a database for fscache and try to make use of crash consistency guarantees
that filesystems already provide.
Namely, use the data dependency already provided by temp files.
It doesn't need to be one temp file per cached file.

Always easier said than done ;-)

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

