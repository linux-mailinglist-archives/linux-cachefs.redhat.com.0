Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FC690C4C
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Feb 2023 15:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675954729;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TSmlsg3/c1R8VCi+wxqJi14piqGtcu9AUMwTWUN1MwM=;
	b=Y7zenkDc6qXuQhFXgFyzICx7gDyLTVYicHJIGSEWRoG1vw7EXgilpFZKXeMDH1uACBH5z7
	DarOxKNcBinkTDT72Xrz8ff2t487lWIk9cxOv1gqfuT3tGbNyXzfHlxWHqJZRIXUJmZz5P
	29wkGZ9mhiv4vYxINxv4yv9OoOdg260=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-SMEqdygVPkm5fUnNOVHEBw-1; Thu, 09 Feb 2023 09:58:42 -0500
X-MC-Unique: SMEqdygVPkm5fUnNOVHEBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A812856502;
	Thu,  9 Feb 2023 14:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6986140EBF6;
	Thu,  9 Feb 2023 14:58:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 133A71946594;
	Thu,  9 Feb 2023 14:58:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4BBF31946589 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 14:58:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 30BF51410F36; Thu,  9 Feb 2023 14:58:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 297AF140EBF6
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 14:58:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D85D281722B
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 14:58:30 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-DaOIWtdXPnCYptm2LlGrpA-1; Thu, 09 Feb 2023 09:58:28 -0500
X-MC-Unique: DaOIWtdXPnCYptm2LlGrpA-1
Received: by mail-pg1-f197.google.com with SMTP id
 201-20020a6300d2000000b004ccf545f44fso1198488pga.12
 for <linux-cachefs@redhat.com>; Thu, 09 Feb 2023 06:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M+Hn8xZygT9no9fpTt3S5jCK2p1FSMh8HQBhcvNZD6Q=;
 b=mUPDCm4mLr1aQBYxJgDU4hS2m50/yacZnNfvhHrNpi1CnH/IK2x0ZHU7FYijc2/E21
 U8xfMmbIlnwg2+I5OV6JLpUqLpycCyb+uI90nVJ5v2+rrhNHJ255A1dzOAFaqxoxLKEX
 tWuH4V1KU2nqAaUnXHSZS1uHgr0+TAWkDcQI9mXvkAVx7fbppPhdboXHWUYutG6MFExA
 rn5d4IOOJaFJDGBiR6/L3KL5ispHXDyZCLj1HfLsreT/mYq+IuM9LCYHUSbvH0zu1cJX
 /i8Y0Mr6ugqx33nRfT+PlUDadEmhVLSD7pvznZ7LWElg3N0lXt6yIVS9mt/T0uIm83gD
 +k7Q==
X-Gm-Message-State: AO0yUKUDGFpKsCS8gWIBTP2ZW1VCtwHjQ5uyLha47dCsG1lFGPXBZlkR
 PSo29Ub/tYBiOztmScacBJ+8k09kpSmLCHyVGpwppLQAyEG47VWQKmWLh3Kos6n6Ib8eq4VWGvg
 1YqGY6J73ks7h7yPw/4+pFJgDxwACjMR3j+902g==
X-Received: by 2002:a17:90a:6807:b0:230:905b:582d with SMTP id
 p7-20020a17090a680700b00230905b582dmr1905564pjj.3.1675954707538; 
 Thu, 09 Feb 2023 06:58:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9XXmlWhj2iAyPUVopuoGNuCAj4ne+TsHapcSeaLD7umYhLgCc24+fqbCal0N23Mn5R4UtN4hk68QfUH3FNBtA=
X-Received: by 2002:a17:90a:6807:b0:230:905b:582d with SMTP id
 p7-20020a17090a680700b00230905b582dmr1905556pjj.3.1675954707124; Thu, 09 Feb
 2023 06:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20221103161637.1725471-1-dwysocha@redhat.com>
In-Reply-To: <20221103161637.1725471-1-dwysocha@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 9 Feb 2023 09:57:50 -0500
Message-ID: <CALF+zOk7ryO7GV7LYWjRa1b+C6fA5J=-=zshd+vE-FxewBNg=A@mail.gmail.com>
To: Anna Schumaker <anna.schumaker@netapp.com>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 3, 2022 at 12:16 PM Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> This v10 patchset addresses at least some of Trond's latest concerns.
> Some of the feedback like the unlock_page() wrapper function in
> nfs_read_completion() I don't know how to address without an
> ifdef.  Other feedback I'm not quite sure about splitting out
> netfs bits or what you would like to see.  Trond I do not want to
> in any way ignore or miss any of your feedback so please elaborate
> as needed.
>
> This patchset converts NFS with fscache non-direct READ IO paths to
> use the netfs API with a non-invasive approach.  The existing NFS pgio
> layer does not need extensive changes, and is the best way so far I've
> found to address Trond's concerns about modifying the IO path [1] as
> well as only enabling netfs when fscache is configured and enabled [2].
> I have not attempted performance comparisions to address Chuck
> Lever's concern [3] because we are not converting the non-fscache
> enabled NFS IO paths to netfs.
>
> The patchset is based on 6.1-rc3 and has been pushed to github at:
> https://github.com/DaveWysochanskiRH/kernel/commits/nfs-fscache-netfs
> https://github.com/DaveWysochanskiRH/kernel/commit/bff09aa979010f38a11a6f92451e85d04d850715
>
> Changes since v9 [7]
> ====================
> PATCH1: Rename nfs_pageio_add_page to nfs_read_add_page (Trond)
> PATCH3: Remove a few #ifdef's and replace with wrappers (Trond) [8]
> PATCH6: RFC patch to reduce increase in nfs_inode memory footprint
> when netfs is configured but not enabled (Trond) [9]
>
> Testing
> =======
> I did not do much testing on this as the changes to patches 1 and 3
> are cosmetic.  Patch #6 is RFC patch and may change, so if that is
> added it may need more testing.
>
> Known issues
> ============
> 1. Unit test setting rsize < readahead does not properly read from
> fscache but re-reads data from the NFS server
> * This will be fixed with another linux-cachefs [4] patch to resolve
> "Stop read optimisation when folio removed from pagecache"
> * Daire Byrne also verified the patch fixes his issue as well
>
> 2. "Cache volume key already in use" after xfstest runs
> * xfstests (hammerspace with vers=4.2,fsc) shows the following on the
> console after some tests:
> "NFS: Cache volume key already in use (nfs,4.1,2,c50,cfe0100a,3,,,8000,100000,100000,bb8,ea60,7530,ea60,1)"
> * This may be fixed with another patch [5] that is in progress
>
> 3. Daire Byrne reported a NULL pointer oops at cachefiles_prepare_write+0x28/0x90
> * harder to reproduce/debug but under investigation [6]
> * only reproduced on RHEL7.9 based NFS re-export server using fscache with upstream kernel plus
> the previous patches
> * Debug in progress, first pass at where the problem is indicates a race
> between fscache cookie LRU and use_cookie; looking at cookie state machine [10]
>
> [58710.346376] BUG: kernel NULL pointer dereference, address: 0000000000000008
> [58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G E      6.0.0-2.dneg.x86_64 #1
> ...
> [58710.389995] Workqueue: events_unbound netfs_rreq_write_to_cache_work [netfs]
> [58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
> ...
> [58710.500316] Call Trace:
> [58710.502894]  <TASK>
> [58710.505126]  netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
> [58710.511201]  process_one_work+0x217/0x3e0
> [58710.515358]  worker_thread+0x4a/0x3b0
> [58710.519152]  ? process_one_work+0x3e0/0x3e0
> [58710.523467]  kthread+0xd6/0x100
> [58710.526740]  ? kthread_complete_and_exit+0x20/0x20
> [58710.531659]  ret_from_fork+0x1f/0x30
>
>
>
> References
> ==========
> [1] https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/
> [2] https://lore.kernel.org/linux-nfs/da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com/
> [3] https://marc.info/?l=linux-nfs&m=160597917525083&w=4
> [4] https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html
> [5] https://marc.info/?l=linux-nfs&m=165962662200679&w=4
> [6] https://listman.redhat.com/archives/linux-cachefs/2022-September/007183.html
> [7] https://marc.info/?l=linux-nfs&m=166600357429305&w=4
> [8] https://marc.info/?l=linux-nfs&m=166697599503342&w=4
> [9] https://marc.info/?l=linux-nfs&m=166717208305834&w=4
> [10] https://listman.redhat.com/archives/linux-cachefs/2022-October/007259.html
>
> Dave Wysochanski (5):
>   NFS: Rename readpage_async_filler to nfs_pageio_add_page
>   NFS: Configure support for netfs when NFS fscache is configured
>   NFS: Convert buffered read paths to use netfs when fscache is enabled
>   NFS: Remove all NFSIOS_FSCACHE counters due to conversion to netfs API
>   NFS: Remove fscache specific trace points and NFS_INO_FSCACHE bit
>
>  fs/nfs/Kconfig             |   1 +
>  fs/nfs/delegation.c        |   2 +-
>  fs/nfs/dir.c               |   2 +-
>  fs/nfs/fscache.c           | 242 ++++++++++++++++++++++---------------
>  fs/nfs/fscache.h           | 111 +++++++++++------
>  fs/nfs/inode.c             |   8 +-
>  fs/nfs/internal.h          |  11 +-
>  fs/nfs/iostat.h            |  17 ---
>  fs/nfs/nfstrace.h          |  91 --------------
>  fs/nfs/pagelist.c          |  12 ++
>  fs/nfs/pnfs.c              |  12 +-
>  fs/nfs/read.c              | 110 +++++++++--------
>  fs/nfs/super.c             |  11 --
>  fs/nfs/write.c             |   2 +-
>  include/linux/nfs_fs.h     |  35 ++++--
>  include/linux/nfs_iostat.h |  12 --
>  include/linux/nfs_page.h   |   3 +
>  include/linux/nfs_xdr.h    |   3 +
>  18 files changed, 335 insertions(+), 350 deletions(-)
>
> --
> 2.31.1
>
> *** BLURB HERE ***
>
> Dave Wysochanski (6):
>   NFS: Rename readpage_async_filler to nfs_read_add_page
>   NFS: Configure support for netfs when NFS fscache is configured
>   NFS: Convert buffered read paths to use netfs when fscache is enabled
>   NFS: Remove all NFSIOS_FSCACHE counters due to conversion to netfs API
>   NFS: Remove fscache specific trace points and NFS_INO_FSCACHE bit
>   netfs: Change netfs_inode_init to allocate memory to allow opt-in
>
>  fs/9p/cache.c              |   2 +-
>  fs/9p/vfs_inode.c          |  17 ++-
>  fs/afs/dynroot.c           |   7 +-
>  fs/afs/inode.c             |  14 +--
>  fs/afs/internal.h          |   2 +-
>  fs/afs/super.c             |   7 ++
>  fs/afs/write.c             |   2 +-
>  fs/ceph/inode.c            |   6 +-
>  fs/netfs/buffered_read.c   |  16 +--
>  fs/netfs/internal.h        |   2 +-
>  fs/netfs/objects.c         |   2 +-
>  fs/nfs/Kconfig             |   1 +
>  fs/nfs/delegation.c        |   2 +-
>  fs/nfs/dir.c               |   2 +-
>  fs/nfs/fscache.c           | 242 ++++++++++++++++++++++---------------
>  fs/nfs/fscache.h           | 136 +++++++++++++++------
>  fs/nfs/inode.c             |  15 ++-
>  fs/nfs/internal.h          |  11 +-
>  fs/nfs/iostat.h            |  17 ---
>  fs/nfs/nfstrace.h          |  91 --------------
>  fs/nfs/pagelist.c          |   4 +
>  fs/nfs/pnfs.c              |  12 +-
>  fs/nfs/read.c              | 110 +++++++++--------
>  fs/nfs/super.c             |  11 --
>  fs/nfs/write.c             |   2 +-
>  include/linux/netfs.h      |  41 +++++--
>  include/linux/nfs_fs.h     |  35 ++++--
>  include/linux/nfs_iostat.h |  12 --
>  include/linux/nfs_page.h   |   3 +
>  include/linux/nfs_xdr.h    |   3 +
>  30 files changed, 428 insertions(+), 399 deletions(-)
>
> --
> 2.31.1
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs
>

Trond, David H, Ben, Daire, others,

I am not sure about the next steps.

I did not see any responses to this v10 posting, other than dhowells
did not like the overhead that patch 6 added to other filesystems
using netfs.  I'm not sure if that's a full NACK on that patch but it
sounded like it to me.
Trond is it ok if I drop patch 6?

Beyond patch 6, Trond, I could post a rebased v11 but I am not sure it
is acceptable to you the way it is and I don't want to do that if
there's changes you want.
From your responses on v9, one issue seems to be that you do not like
the wrapping the NFS requests inside netfs requests for example.
But I do not know another approach other than bypassing pgio layer
completely which as far as I understand creates a whole new set of
issues to be solved.
Possibly you have another approach in mind or see the need for other
refactoring or patches that should be done that would make this set
more acceptable?
I am not sure if you have other concerns on this v10.  If steps can be
outlined a little better I can work on them.
As it is now I'm not sure whether this needs a rebase and a v11
posting, or a rethinking of the approach.

Regarding the known issues, as far as I know issues #1 and #2 are
still outstanding.
I know issue #3 is fixed with
b5b52de3214a fscache: Fix oops due to race with cookie_lru and use_cookie

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

