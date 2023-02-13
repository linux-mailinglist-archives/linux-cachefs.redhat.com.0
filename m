Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A42694BD6
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Feb 2023 16:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676303807;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G4kQFKYbMQ+zq8NWWi70AT/I4OxfoUqUQvH3Al6yweI=;
	b=aAonmcQydESXtLpqmydgCsHG0Kimk6PhiTEUD9eN0mB+C8fltHcwDw/1FQscN09CjezJw5
	N8rv5ST/Bncm7//FivmX3GZw9KJHCKixcg/BmlcKhmj/+TFGZgLhOTrNISM6z58DYJ5dGa
	4xYJLU3v//VOTrnGcpHcSe0fy+0Ix/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-BrwiIYEpMfOpXVVFsDfZiQ-1; Mon, 13 Feb 2023 10:56:47 -0500
X-MC-Unique: BrwiIYEpMfOpXVVFsDfZiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01849800B23;
	Mon, 13 Feb 2023 15:56:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD981C16023;
	Mon, 13 Feb 2023 15:56:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 41159194658F;
	Mon, 13 Feb 2023 15:56:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 404C51946586 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 13 Feb 2023 15:56:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 055B91C55A; Mon, 13 Feb 2023 15:56:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1DB218EC7
 for <linux-cachefs@redhat.com>; Mon, 13 Feb 2023 15:56:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C43B218A6462
 for <linux-cachefs@redhat.com>; Mon, 13 Feb 2023 15:56:32 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-2_e_WpBpPjONmBonEMi20w-1; Mon, 13 Feb 2023 10:56:31 -0500
X-MC-Unique: 2_e_WpBpPjONmBonEMi20w-1
Received: by mail-pg1-f200.google.com with SMTP id
 c15-20020a63ea0f000000b004fb3ed8a500so4855241pgi.10
 for <linux-cachefs@redhat.com>; Mon, 13 Feb 2023 07:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=krLGrAAJWyY0U0dpUHbgBoCjScVTRFXv4FSYFVlMqVY=;
 b=DH8qNiPeRhubNR7riJ5SkmXwZ5GPBHHBcdkR/cgfDak3gWKawgc1lyVBIJGtAfbu6s
 /P8YoAsYgvTEfi/BAOv5MauUZTe5LW8kBwnSXhn5f2N7EuCJ88L/4BW3JHowMr56Rbnd
 ALLKGJTYU2yL0lnGv1u0BYFyDao7zqm9YWqkqAWprQG60zcqWSTYTMU9vW/tmS/PebI8
 oY0oseTkJrUuXQxNbyl6rFZDz38Z0Wai3pK+NRKQEkR4TV9R0nOCKeXGYcIZXEQwxBSz
 uan7OF2ByRj5/gAU3ZdMBZwz1NFOfsB6s97xHJynH96XKzmBXv/z3jWiQLDZU1Lqv2dr
 dzSQ==
X-Gm-Message-State: AO0yUKV0dvhZBEA+HUzDD7O8EcvrWqF1bZrI0dtTUCgf/QWHeWZuPi6E
 ZGKceEAlSguVHbWATUwCVjxrfQnXva/tKTlibRzbSRAJUDDdvJ+8VcDFxoFc3FsvGxgFkDdVDla
 4UmU124M6fvOSFm3DSob9l0Yew92jNd8JBvYgph2f1YlmMg==
X-Received: by 2002:a17:90a:2983:b0:233:a922:a64b with SMTP id
 h3-20020a17090a298300b00233a922a64bmr2624902pjd.3.1676303789848; 
 Mon, 13 Feb 2023 07:56:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/7srQxwYYlnor9XQbaPPG6Y00z14czMt3uwRyNUJv2/VfXvbXF70YuVhfEblRm6UcWMUcdyev8Q86/ZZVvCqI=
X-Received: by 2002:a17:90a:2983:b0:233:a922:a64b with SMTP id
 h3-20020a17090a298300b00233a922a64bmr2624893pjd.3.1676303789474; Mon, 13 Feb
 2023 07:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20221103161637.1725471-1-dwysocha@redhat.com>
 <CALF+zOk7ryO7GV7LYWjRa1b+C6fA5J=-=zshd+vE-FxewBNg=A@mail.gmail.com>
 <4d60636f62df4f5c200666ed2d1a5f2414c18e1f.camel@kernel.org>
In-Reply-To: <4d60636f62df4f5c200666ed2d1a5f2414c18e1f.camel@kernel.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 13 Feb 2023 10:55:53 -0500
Message-ID: <CALF+zOk3=fs_UQBaFnDQ-Wm0O0UYUP4RYc=woXbviRmSPwjC3w@mail.gmail.com>
To: Trond Myklebust <trondmy@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v10 0/6] Convert NFS with fscache to the
 netfs API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 9, 2023 at 12:41 PM Trond Myklebust <trondmy@kernel.org> wrote:
>
> On Thu, 2023-02-09 at 09:57 -0500, David Wysochanski wrote:
> > On Thu, Nov 3, 2022 at 12:16 PM Dave Wysochanski
> > <dwysocha@redhat.com> wrote:
> > >
> > > This v10 patchset addresses at least some of Trond's latest
> > > concerns.
> > > Some of the feedback like the unlock_page() wrapper function in
> > > nfs_read_completion() I don't know how to address without an
> > > ifdef.  Other feedback I'm not quite sure about splitting out
> > > netfs bits or what you would like to see.  Trond I do not want to
> > > in any way ignore or miss any of your feedback so please elaborate
> > > as needed.
> > >
> > > This patchset converts NFS with fscache non-direct READ IO paths to
> > > use the netfs API with a non-invasive approach.  The existing NFS
> > > pgio
> > > layer does not need extensive changes, and is the best way so far
> > > I've
> > > found to address Trond's concerns about modifying the IO path [1]
> > > as
> > > well as only enabling netfs when fscache is configured and enabled
> > > [2].
> > > I have not attempted performance comparisions to address Chuck
> > > Lever's concern [3] because we are not converting the non-fscache
> > > enabled NFS IO paths to netfs.
> > >
> > > The patchset is based on 6.1-rc3 and has been pushed to github at:
> > > https://github.com/DaveWysochanskiRH/kernel/commits/nfs-fscache-netfs
> > > https://github.com/DaveWysochanskiRH/kernel/commit/bff09aa979010f38a11a6f92451e85d04d850715
> > >
> > > Changes since v9 [7]
> > > ====================
> > > PATCH1: Rename nfs_pageio_add_page to nfs_read_add_page (Trond)
> > > PATCH3: Remove a few #ifdef's and replace with wrappers (Trond) [8]
> > > PATCH6: RFC patch to reduce increase in nfs_inode memory footprint
> > > when netfs is configured but not enabled (Trond) [9]
> > >
> > > Testing
> > > =======
> > > I did not do much testing on this as the changes to patches 1 and 3
> > > are cosmetic.  Patch #6 is RFC patch and may change, so if that is
> > > added it may need more testing.
> > >
> > > Known issues
> > > ============
> > > 1. Unit test setting rsize < readahead does not properly read from
> > > fscache but re-reads data from the NFS server
> > > * This will be fixed with another linux-cachefs [4] patch to
> > > resolve
> > > "Stop read optimisation when folio removed from pagecache"
> > > * Daire Byrne also verified the patch fixes his issue as well
> > >
> > > 2. "Cache volume key already in use" after xfstest runs
> > > * xfstests (hammerspace with vers=4.2,fsc) shows the following on
> > > the
> > > console after some tests:
> > > "NFS: Cache volume key already in use
> > > (nfs,4.1,2,c50,cfe0100a,3,,,8000,100000,100000,bb8,ea60,7530,ea60,1
> > > )"
> > > * This may be fixed with another patch [5] that is in progress
> > >
> > > 3. Daire Byrne reported a NULL pointer oops at
> > > cachefiles_prepare_write+0x28/0x90
> > > * harder to reproduce/debug but under investigation [6]
> > > * only reproduced on RHEL7.9 based NFS re-export server using
> > > fscache with upstream kernel plus
> > > the previous patches
> > > * Debug in progress, first pass at where the problem is indicates a
> > > race
> > > between fscache cookie LRU and use_cookie; looking at cookie state
> > > machine [10]
> > >
> > > [58710.346376] BUG: kernel NULL pointer dereference, address:
> > > 0000000000000008
> > > [58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G
> > > E      6.0.0-2.dneg.x86_64 #1
> > > ...
> > > [58710.389995] Workqueue: events_unbound
> > > netfs_rreq_write_to_cache_work [netfs]
> > > [58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90
> > > [cachefiles]
> > > ...
> > > [58710.500316] Call Trace:
> > > [58710.502894]  <TASK>
> > > [58710.505126]  netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
> > > [58710.511201]  process_one_work+0x217/0x3e0
> > > [58710.515358]  worker_thread+0x4a/0x3b0
> > > [58710.519152]  ? process_one_work+0x3e0/0x3e0
> > > [58710.523467]  kthread+0xd6/0x100
> > > [58710.526740]  ? kthread_complete_and_exit+0x20/0x20
> > > [58710.531659]  ret_from_fork+0x1f/0x30
> > >
> > >
> > >
> > > References
> > > ==========
> > > [1]
> > > https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/
> > > [2]
> > > https://lore.kernel.org/linux-nfs/da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com/
> > > [3] https://marc.info/?l=linux-nfs&m=160597917525083&w=4
> > > [4]
> > > https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html
> > > [5] https://marc.info/?l=linux-nfs&m=165962662200679&w=4
> > > [6]
> > > https://listman.redhat.com/archives/linux-cachefs/2022-September/007183.html
> > > [7] https://marc.info/?l=linux-nfs&m=166600357429305&w=4
> > > [8] https://marc.info/?l=linux-nfs&m=166697599503342&w=4
> > > [9] https://marc.info/?l=linux-nfs&m=166717208305834&w=4
> > > [10]
> > > https://listman.redhat.com/archives/linux-cachefs/2022-October/007259.html
> > >
> > > Dave Wysochanski (5):
> > >   NFS: Rename readpage_async_filler to nfs_pageio_add_page
> > >   NFS: Configure support for netfs when NFS fscache is configured
> > >   NFS: Convert buffered read paths to use netfs when fscache is
> > > enabled
> > >   NFS: Remove all NFSIOS_FSCACHE counters due to conversion to
> > > netfs API
> > >   NFS: Remove fscache specific trace points and NFS_INO_FSCACHE bit
> > >
> > >  fs/nfs/Kconfig             |   1 +
> > >  fs/nfs/delegation.c        |   2 +-
> > >  fs/nfs/dir.c               |   2 +-
> > >  fs/nfs/fscache.c           | 242 ++++++++++++++++++++++-----------
> > > ----
> > >  fs/nfs/fscache.h           | 111 +++++++++++------
> > >  fs/nfs/inode.c             |   8 +-
> > >  fs/nfs/internal.h          |  11 +-
> > >  fs/nfs/iostat.h            |  17 ---
> > >  fs/nfs/nfstrace.h          |  91 --------------
> > >  fs/nfs/pagelist.c          |  12 ++
> > >  fs/nfs/pnfs.c              |  12 +-
> > >  fs/nfs/read.c              | 110 +++++++++--------
> > >  fs/nfs/super.c             |  11 --
> > >  fs/nfs/write.c             |   2 +-
> > >  include/linux/nfs_fs.h     |  35 ++++--
> > >  include/linux/nfs_iostat.h |  12 --
> > >  include/linux/nfs_page.h   |   3 +
> > >  include/linux/nfs_xdr.h    |   3 +
> > >  18 files changed, 335 insertions(+), 350 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> > > *** BLURB HERE ***
> > >
> > > Dave Wysochanski (6):
> > >   NFS: Rename readpage_async_filler to nfs_read_add_page
> > >   NFS: Configure support for netfs when NFS fscache is configured
> > >   NFS: Convert buffered read paths to use netfs when fscache is
> > > enabled
> > >   NFS: Remove all NFSIOS_FSCACHE counters due to conversion to
> > > netfs API
> > >   NFS: Remove fscache specific trace points and NFS_INO_FSCACHE bit
> > >   netfs: Change netfs_inode_init to allocate memory to allow opt-in
> > >
> > >  fs/9p/cache.c              |   2 +-
> > >  fs/9p/vfs_inode.c          |  17 ++-
> > >  fs/afs/dynroot.c           |   7 +-
> > >  fs/afs/inode.c             |  14 +--
> > >  fs/afs/internal.h          |   2 +-
> > >  fs/afs/super.c             |   7 ++
> > >  fs/afs/write.c             |   2 +-
> > >  fs/ceph/inode.c            |   6 +-
> > >  fs/netfs/buffered_read.c   |  16 +--
> > >  fs/netfs/internal.h        |   2 +-
> > >  fs/netfs/objects.c         |   2 +-
> > >  fs/nfs/Kconfig             |   1 +
> > >  fs/nfs/delegation.c        |   2 +-
> > >  fs/nfs/dir.c               |   2 +-
> > >  fs/nfs/fscache.c           | 242 ++++++++++++++++++++++-----------
> > > ----
> > >  fs/nfs/fscache.h           | 136 +++++++++++++++------
> > >  fs/nfs/inode.c             |  15 ++-
> > >  fs/nfs/internal.h          |  11 +-
> > >  fs/nfs/iostat.h            |  17 ---
> > >  fs/nfs/nfstrace.h          |  91 --------------
> > >  fs/nfs/pagelist.c          |   4 +
> > >  fs/nfs/pnfs.c              |  12 +-
> > >  fs/nfs/read.c              | 110 +++++++++--------
> > >  fs/nfs/super.c             |  11 --
> > >  fs/nfs/write.c             |   2 +-
> > >  include/linux/netfs.h      |  41 +++++--
> > >  include/linux/nfs_fs.h     |  35 ++++--
> > >  include/linux/nfs_iostat.h |  12 --
> > >  include/linux/nfs_page.h   |   3 +
> > >  include/linux/nfs_xdr.h    |   3 +
> > >  30 files changed, 428 insertions(+), 399 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> > > --
> > > Linux-cachefs mailing list
> > > Linux-cachefs@redhat.com
> > > https://listman.redhat.com/mailman/listinfo/linux-cachefs
> > >
> >
> > Trond, David H, Ben, Daire, others,
> >
> > I am not sure about the next steps.
> >
> > I did not see any responses to this v10 posting, other than dhowells
> > did not like the overhead that patch 6 added to other filesystems
> > using netfs.  I'm not sure if that's a full NACK on that patch but it
> > sounded like it to me.
> > Trond is it ok if I drop patch 6?
> >
>
> If you drop patch 6, then we need another way to get rid of the
> ugliness introduced by netfs_inode. I don't want to add those wrappers
> in order to access the inode in 'struct nfs_inode'.
>
> One solution might be an anonymous union. i.e.
> struct nfs_inode {
> ....
>         union {
>                 struct inode vfs_inode;
> #ifdef CONFIG_NFS_FSCACHE
>                 struct netfs_inode netfs_inode;
> #endif
>         };
> };
>
>
> ...and then move the wretched xattr_cache field to reside above that
> union.
>

Yes I definitely can do this.  Making this change reduces the churn
in patch #2, significantly (see below).

Do you want me to rebase, test, and re-post a v11 of this series
through patch #5 or do you want more time to comment on patches
3-5?


$ git show --stat
commit a8b2617550ea85f40a546430f3199670beccec1d (HEAD ->
nfs-fscache-netfs, origin/nfs-fscache-netfs)
Author: Dave Wysochanski <dwysocha@redhat.com>
Date:   Wed May 4 10:12:47 2022 -0400

    NFS: Configure support for netfs when NFS fscache is configured

    As first steps for support of the netfs library when NFS_FSCACHE is
    configured, add NETFS_SUPPORT to Kconfig and add the required netfs_inode
    into struct nfs_inode.

    Using netfs requires we move the VFS inode structure to be stored
    inside struct netfs_inode, along with the fscache_cookie.
    Thus, if NFS_FSCACHE is configured, place netfs_inode inside an
    anonymous union so the vfs_inode memory is the same and we do
    not need to modify other non-fscache areas of NFS.
    In addition, inside the NFS fscache code, use the new helpers,
    netfs_inode() and netfs_i_cookie() helpers, and remove our own
    helper, nfs_i_fscache().

    Later patches will convert NFS fscache to fully use netfs.

    Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>

 fs/nfs/Kconfig         |  1 +
 fs/nfs/fscache.c       | 20 +++++++++-----------
 fs/nfs/fscache.h       | 15 ++++++---------
 include/linux/nfs_fs.h | 24 ++++++++++--------------
 4 files changed, 26 insertions(+), 34 deletions(-)
[dwysocha@dwysocha kernel]$ git show include/linux/nfs_fs.h
commit a8b2617550ea85f40a546430f3199670beccec1d (HEAD ->
nfs-fscache-netfs, origin/nfs-fscache-netfs)
Author: Dave Wysochanski <dwysocha@redhat.com>
Date:   Wed May 4 10:12:47 2022 -0400

    NFS: Configure support for netfs when NFS fscache is configured

    As first steps for support of the netfs library when NFS_FSCACHE is
    configured, add NETFS_SUPPORT to Kconfig and add the required netfs_inode
    into struct nfs_inode.

    Using netfs requires we move the VFS inode structure to be stored
    inside struct netfs_inode, along with the fscache_cookie.
    Thus, if NFS_FSCACHE is configured, place netfs_inode inside an
    anonymous union so the vfs_inode memory is the same and we do
    not need to modify other non-fscache areas of NFS.
    In addition, inside the NFS fscache code, use the new helpers,
    netfs_inode() and netfs_i_cookie() helpers, and remove our own
    helper, nfs_i_fscache().

    Later patches will convert NFS fscache to fully use netfs.

    Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>

diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 45c44211e50e..580847c70fec 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -31,6 +31,10 @@
 #include <linux/sunrpc/auth.h>
 #include <linux/sunrpc/clnt.h>

+#ifdef CONFIG_NFS_FSCACHE
+#include <linux/netfs.h>
+#endif
+
 #include <linux/nfs.h>
 #include <linux/nfs2.h>
 #include <linux/nfs3.h>
@@ -204,14 +208,15 @@ struct nfs_inode {
        /* how many bytes have been written/read and how many bytes queued up */
        __u64 write_io;
        __u64 read_io;
-#ifdef CONFIG_NFS_FSCACHE
-       struct fscache_cookie   *fscache;
-#endif
-       struct inode            vfs_inode;
-
 #ifdef CONFIG_NFS_V4_2
        struct nfs4_xattr_cache *xattr_cache;
 #endif
+       union {
+               struct inode            vfs_inode;
+#ifdef CONFIG_NFS_FSCACHE
+               struct netfs_inode      netfs; /* netfs context and VFS inode */
+#endif
+       };
 };

 struct nfs4_copy_state {
@@ -329,15 +334,6 @@ static inline int NFS_STALE(const struct inode *inode)
        return test_bit(NFS_INO_STALE, &NFS_I(inode)->flags);
 }

-static inline struct fscache_cookie *nfs_i_fscache(struct inode *inode)
-{
-#ifdef CONFIG_NFS_FSCACHE
-       return NFS_I(inode)->fscache;
-#else
-       return NULL;
-#endif
-}
-
 static inline __u64 NFS_FILEID(const struct inode *inode)
 {
        return NFS_I(inode)->fileid;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

