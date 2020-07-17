Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BC244223E17
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Jul 2020 16:34:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-PEHDawdiMquFcehWfaiung-1; Fri, 17 Jul 2020 10:34:35 -0400
X-MC-Unique: PEHDawdiMquFcehWfaiung-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F1988014D7;
	Fri, 17 Jul 2020 14:34:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 115BD1A7C8;
	Fri, 17 Jul 2020 14:34:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2939496235;
	Fri, 17 Jul 2020 14:34:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HEYO2u003743 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 10:34:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C355A2018284; Fri, 17 Jul 2020 14:34:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267462026D5D
	for <linux-cachefs@redhat.com>; Fri, 17 Jul 2020 14:34:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1645083B822
	for <linux-cachefs@redhat.com>; Fri, 17 Jul 2020 14:34:20 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-15-1qJuROPHN3-T3GPqk0HMGg-1;
	Fri, 17 Jul 2020 10:34:18 -0400
X-MC-Unique: 1qJuROPHN3-T3GPqk0HMGg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 652EA876B; Fri, 17 Jul 2020 10:25:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 652EA876B
Date: Fri, 17 Jul 2020 10:25:41 -0400
To: Dave Wysochanski <dwysocha@redhat.com>
Message-ID: <20200717142541.GA21567@fieldses.org>
References: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1594825849-24991-1-git-send-email-dwysocha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
From: bfields@fieldses.org (J. Bruce Fields)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [RFC PATCH v1 0/13] Convert NFS client to new
	fscache-iter API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 15, 2020 at 11:10:36AM -0400, Dave Wysochanski wrote:
> These patches update the nfs client to use the new FS-Cache API and are at:
> https://github.com/DaveWysochanskiRH/kernel/commit/a426b431873ea755c94ccd403aeaba0c4e635016

Say I had a hypothetical, err, friend, who hadn't been following that
FS-Cache work--could you summarize the advantages it bring us?

--b.

> 
> They are based on David Howells fscache-iter tree at ff12b5a05bd6984ad83e762f702cb655222bad74
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=fscache-iter&id=ff12b5a05bd6984ad83e762f702cb655222bad74
> 
> The following patches may be of specific interest to review
> as they are related to the conversion:
> NFS: Convert fscache_acquire_cookie and fscache_relinquish_cookie
> NFS: Convert nfs_readpage() and readpages() to new fscache API
> NFS: Only use and unuse an fscache cookie a single time based on NFS_INO_FSCACHE
> NFS: Convert fscache invalidation and update aux_data and i_size
> 
> Note that this is only a "first pass" v1 / RFC set I wanted to get
> out there for the maintainers to see and know this is being worked on.
> It is far from perfect and has some problems still need worked out.
> A short summary of this set:
> 
> 1. Takes a "least invasive to existing code" approach
> * most fscache bits stay fs/nfs/fscache.[ch] 
> * fscache enable/disable switched inside NFS code on nfs_inode.fscache
> * only enable fscache for reads
> * may not be the best approach (see future patcheset items below)
> 
> 2. Basically works and passes a series of tests
> * should not affect NFS when fscache is disabled (no "fsc" option)
> * a couple small NFS + fscache basic verification tests
> * connectathon (all NFS versions, with/without 'fsc' option)
> * various iozone tests (all NFS versions, with/without 'fsc' option)
> 
> 3. Still has a few known problems that are being tracked down
> * Data integrity issue when write with O_DIRECT and read
> back without O_DIRECT (we get 0's back from the cache)
> * iozone tests run through ok but at the end superblock
> cookies are left (each NFS version has a different superblock
> cookie); this leads to "duplicate cookie" messages
> upon subsequent mounts / runs
> * A couple oopses in fscache reported to dhowells, may
> be related to NFS's enable/disable of fscache on read/write
> * Kernel build fails about halfway through with a strange
> dubious error at the same place, linking this file:
> ld: net/sunrpc/auth_gss/trace.o: attempt to load strings from a non-string section (number 41)
> 
> 
> In addition to fixing various code issues and above issues,
> a future patchset may:
> 
> 1. The readpage/readpages conversion patch call read_helpers
> directly rather than isolation into fs/nfs/fscache.c
> * Similar to the AFS conversion, with calls directly to the
> read_helpers, but not sure about non-fsc code path
> 
> 2. Add write-through support
> * Would probably eliminate some problematic code
> paths where fscache is turned on / off depending on whether
> a file switches from read to write and vice-versa
> * This would rework open as well
> * Have to work out whether this is possible or not and
> with what caveats as far as NFS version support (is this
> an NFSv4.x only thing?)
> 
> 3. Rework dfprintks and/or add ftrace points
> * fscache/cachefiles has 'debug' logging similar to rpcdebug
> so not sure if we keep rpcdebug here or go full ftrace
> 
> 
> Dave Wysochanski (13):
>   NFS: Clean up nfs_readpage() and nfs_readpages()
>   NFS: In nfs_readpage() only increment NFSIOS_READPAGES when read
>     succeeds
>   NFS: Refactor nfs_readpage() and nfs_readpage_async() to use
>     nfs_readdesc
>   NFS: Call readpage_async_filler() from nfs_readpage_async()
>   NFS: Add nfs_pageio_complete_read() and remove nfs_readpage_async()
>   NFS: Rename readpage_async_filler() to nfs_pageio_add_page_read()
>   NFS: Convert fscache_acquire_cookie and fscache_relinquish_cookie
>   NFS: Allow nfs_async_read_completion_ops to be used by other NFS code
>   NFS: Convert nfs_readpage() and readpages() to new fscache API
>   NFS: Allow NFS use of new fscache API in build
>   NFS: Only use and unuse an fscache cookie a single time based on
>     NFS_INO_FSCACHE
>   NFS: Convert fscache invalidation and update aux_data and i_size
>   NFS: Call nfs_fscache_invalidate() when write extends the size of the
>     file
> 
>  fs/nfs/Kconfig           |   2 +-
>  fs/nfs/file.c            |  20 +--
>  fs/nfs/fscache-index.c   |  94 --------------
>  fs/nfs/fscache.c         | 315 ++++++++++++++++++++++++-----------------------
>  fs/nfs/fscache.h         |  92 +++++---------
>  fs/nfs/inode.c           |   1 -
>  fs/nfs/internal.h        |   4 +
>  fs/nfs/pagelist.c        |   1 +
>  fs/nfs/read.c            | 221 ++++++++++++++++-----------------
>  fs/nfs/write.c           |   9 +-
>  include/linux/nfs_fs.h   |   3 +-
>  include/linux/nfs_page.h |   1 +
>  include/linux/nfs_xdr.h  |   1 +
>  13 files changed, 322 insertions(+), 442 deletions(-)
> 
> -- 
> 1.8.3.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

