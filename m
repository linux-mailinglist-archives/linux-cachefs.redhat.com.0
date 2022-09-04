Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E03545AC385
	for <lists+linux-cachefs@lfdr.de>; Sun,  4 Sep 2022 11:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662282364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R6yBhHiV2RXh4IKTn+Jbiv8npRjnYEpxRRlUlO2Zzg8=;
	b=eTwmDljzL4IsMEcFLRnj4TU0/6PnI/tuSrNCyVNVnsMaheFpg8k2whT71K23q6hupkuRDH
	2mxzZ+n+bazBayxk2/q8z9PdAErzqbn4Y5SbsFGchQ50a/1iqRkrP5p7rBKhTsqdWKWovp
	4PRmVcFjGfu9KSlH8mSGFDiEZTtWkhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-n8kj61hWMbG29Gob1ZOAUg-1; Sun, 04 Sep 2022 05:06:02 -0400
X-MC-Unique: n8kj61hWMbG29Gob1ZOAUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E8FD101A54E;
	Sun,  4 Sep 2022 09:06:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31E2D492CA2;
	Sun,  4 Sep 2022 09:05:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E013194035B;
	Sun,  4 Sep 2022 09:05:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9FC8194B966 for <linux-cachefs@listman.corp.redhat.com>;
 Sun,  4 Sep 2022 09:05:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BBAAA1415137; Sun,  4 Sep 2022 09:05:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B6061415102;
 Sun,  4 Sep 2022 09:05:58 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Sun,  4 Sep 2022 05:05:54 -0400
Message-Id: <20220904090557.1901131-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH v6 0/3] Convert NFS with fscache to the
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset converts NFS with fscache non-direct READ IO paths to
use the netfs API with a non-invasive approach.  The existing NFS pgio
layer does not need extensive changes, and is the best way so far I've
found to address Trond's concerns about modifying the IO path [1] as
well as only enabling netfs when fscache is configured and enabled [2].
I have not attempted performance comparisions to address Chuck
Lever's concern [3] because we are not converting the non-fscache
enabled NFS IO paths to netfs.

The main patch to be reviewed is patch #3 which converts nfs_read_folio
and nfs_readahead.

The patchset is based on 6.0-rc3 and has been pushed to github at:
https://github.com/DaveWysochanskiRH/kernel/commits/nfs-fscache-netfs
https://github.com/DaveWysochanskiRH/kernel/commit/152f43e3de2cce4e331593bd425c638a4a430a7c


Changes since v5
================
Patch1: Add Jeff Layton's reviewed-by (from v3 posting)
Patch2: Add Jeff Layton's reviewed-by (from v5 posting)
Patch3: Make netfs->transferred atomic64_t, drop spinlock (Jeff Layton)
Patch3: Various cleanups
- rename nfs_netfs_read_initiate to nfs_netfs_initiate_read
- rename nfs_fscache_read_folio to nfs_netfs_read_folio
- rename nfs_fscache_readahead to nfs_netfs_readahead
- rename nfs_netfs_read_done nfs_netfs_readpage_done
- move unlock_page inside nfs_netfs_readpage_release
- use netfs_inode() helper in more places


Testing
=======
The patches are fairly stable as evidenced with xfstests generic with
various servers, both with and without fscache enabled: 
hammerspace(pNFS flexfiles): NFS4.1,NFS4.2
NetApp(pNFS filelayout): NFS3,NFS4.0,NFS4.1
RHEL8: NFS3,NFS4.1,NFS4.2

No major issues outstanding.  The known issues are as follows:

1. Unit test setting rsize < readahead does not properly read from
fscache but re-reads data from the NFS server
* This will be fixed with another linux-cachefs [4] patch to resolve
"Stop read optimisation when folio removed from pagecache"
* Daire Byrne also verified the patch fixes his issue as well

2. "Cache volume key already in use" after xfstest runs
* xfstests (hammerspace with vers=4.2,fsc) shows the following on the
console after some tests:
"NFS: Cache volume key already in use (nfs,4.1,2,c50,cfe0100a,3,,,8000,100000,100000,bb8,ea60,7530,ea60,1)"
* This may be fixed with another patch [5] that is in progress

3. generic/127 triggers "Subreq overread" warning
* Intermittent, hard to reproduce 
* Seen with NFSv3 and RHEL8 server
[ 4196.864176] run fstests generic/127 at 2022-08-31 17:29:38
[ 5608.997945] ------------[ cut here ]------------
[ 5609.000476] Subreq overread: R1c85d[0] 73728 > 70073 - 0


Outstanding work
================
Note that the existing NFS fscache stats ("fsc:" line in /proc/self/mountstats)
as well as trace events still need removed.  I've left these out of
this patchset for now as removing them are benign and can come later
(the stats will all be 0, and trace events are no longer used).
The existing NFS fscache stat counts no longer apply since the new
API is not page based - they are not meaningful or possible to obtain,
and there are new fscache stats in /proc/fs/fscache/stats.  A similar
situation exists with the NFS trace events - netfs and fscache have
plenty of trace events so the NFS specific ones probably are not needed.


References
==========
[1] https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/
[2] https://lore.kernel.org/linux-nfs/da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com/
[3] https://marc.info/?l=linux-nfs&m=160597917525083&w=4
[4] https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html
[5] https://marc.info/?l=linux-nfs&m=165962662200679&w=4

Dave Wysochanski (3):
  NFS: Rename readpage_async_filler to nfs_pageio_add_page
  NFS: Configure support for netfs when NFS fscache is configured
  NFS: Convert buffered read paths to use netfs when fscache is enabled

 fs/nfs/Kconfig           |   1 +
 fs/nfs/delegation.c      |   2 +-
 fs/nfs/dir.c             |   2 +-
 fs/nfs/fscache.c         | 251 +++++++++++++++++++++++----------------
 fs/nfs/fscache.h         | 101 ++++++++++------
 fs/nfs/inode.c           |   8 +-
 fs/nfs/internal.h        |  11 +-
 fs/nfs/pagelist.c        |  12 ++
 fs/nfs/pnfs.c            |  12 +-
 fs/nfs/read.c            | 111 +++++++++--------
 fs/nfs/write.c           |   2 +-
 include/linux/nfs_fs.h   |  34 ++++--
 include/linux/nfs_page.h |   3 +
 include/linux/nfs_xdr.h  |   3 +
 14 files changed, 335 insertions(+), 218 deletions(-)

-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

