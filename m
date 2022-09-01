Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873E5A8AD8
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Sep 2022 03:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661996194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zflRhY05s4edYnMtKVzQpQZjU2bonHaM5+KaBVZi3zw=;
	b=ICk5FqJ0Rjxn4Snygd9fOdty7us8U0KiIt3gD3gL19M4zer+eLe43wx/EqK7KmI0tOlZpb
	24h1Ia3s/9DBvAYEoiD2mLNYQ1L2XevR1rF/totz0nlJqHH2XqqZOm2vo0tRU7zeWjWwTE
	o2QhgFe3NoFk1jTUH/5DWNxHzg5fSbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-o8tkr0vNPPmoloJiOrkMwA-1; Wed, 31 Aug 2022 21:36:31 -0400
X-MC-Unique: o8tkr0vNPPmoloJiOrkMwA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C04185A7B2;
	Thu,  1 Sep 2022 01:36:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E65DB492C3B;
	Thu,  1 Sep 2022 01:36:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C116D1946A4B;
	Thu,  1 Sep 2022 01:36:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E17851946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 00:48:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D30A0403349; Thu,  1 Sep 2022 00:48:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0D8492C3B;
 Thu,  1 Sep 2022 00:48:52 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Wed, 31 Aug 2022 20:48:47 -0400
Message-Id: <20220901004850.1431412-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH v4 0/3] Convert NFS with fscache to the
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

Changes since v3
- PATCH2: Improve #ifdef readability; use VFS_I #define (Jeff Layton)
- PATCH3: Fix Aug 30 kernel test robot <lkp@intel.com> compile warning due
  to unusued 'sreq' variables in fscache.c (test build with W=1)
- PATCH3: Simplify nfs_netfs_init_request (Jeff Layton, Matt Wilcox)

The patches are fairly stable as evidenced with xfstests generic with
various servers: hammerspace w/NFS4.2+fscache,
NetApp(ontap9) NFSv4.1+fscache (other tests in progress)
The known issues are as follows:

No major issues outstanding - the data corruption is unrelated to this
patchset.  The known issues are as follows:

1. Unit test setting rsize < readahead does not properly read from
fscache but re-reads data from the NFS server
* This will be fixed with another linux-cachefs [4] patch to resolve
"Stop read optimisation when folio removed from pagecache"

2. "Cache volume key already in use" after xfstest runs
* xfstests (hammerspace with vers=4.2,fsc) shows the following on the
console after some tests:
"NFS: Cache volume key already in use (nfs,4.1,2,c50,cfe0100a,3,,,8000,100000,100000,bb8,ea60,7530,ea60,1)"
* This may be fixed with another patch [4] that is in progress

3. (RESOLVED) Hang

4. (DEFERRED/UNRELATED) Data corruption seen with unit test where rsize < readahead
* Confirmed unrelated to this patchset
* Seen with vanilla 6.0-rc2 (did not occur on 5.19)
* Not 100% reproducible (maybe 75% of the time)
* NFS protocol version doesn't matter
* First page is always fine, next 3 pages are not
* Garbage data is coming over the wire from the NFS server
because the NFS server file is garbage (the dd of the file from
/tmp to NFS /mnt corrupts it).
 mount -o vers=4.2,fsc,rsize=8192 127.0.0.1:/export /mnt
 dd if=/dev/urandom of=/tmp/integrity-rsize-file1.bin bs=16k count=1
 ./nfs-readahead.sh set /mnt 16384
 dd if=/tmp/integrity-rsize-file1.bin of=/mnt/integrity-rsize-file1.bin bs=16k count=1
 echo 3 > /proc/sys/vm/drop_caches
 md5sum /mnt/integrity-rsize-file1.bin /tmp/integrity-rsize-file1.bin
 md5sums don't match, MD5_NFS = 00eaf1a5bc1b3dfd54711db551619afa != MD5_LOCAL = e8d835c83ba1f1264869dc40673fa20c

5. generic/127 triggers "Subreq overread" warning
* just hit one time; did not stop test
[ 4196.864176] run fstests generic/127 at 2022-08-31 17:29:38
[ 5608.997945] ------------[ cut here ]------------
[ 5609.000476] Subreq overread: R1c85d[0] 73728 > 70073 - 0


The patchset is based on 6.0-rc3 and has been pushed to github at:
https://github.com/DaveWysochanskiRH/kernel/commits/nfs-fscache-netfs

[1] https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/
[2] https://lore.kernel.org/linux-nfs/da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com/
[3] https://marc.info/?l=linux-nfs&m=160597917525083&w=4
[4] https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html
[5] https://marc.info/?l=linux-nfs&m=165962662200679&w=4

Dave Wysochanski (3):
  NFS: Rename readpage_async_filler to nfs_pageio_add_page
  NFS: Add support for netfs in struct nfs_inode and Kconfig
  NFS: Convert nfs_read_folio and nfs_readahead to netfs APIs

 fs/nfs/Kconfig           |   1 +
 fs/nfs/delegation.c      |   2 +-
 fs/nfs/dir.c             |   2 +-
 fs/nfs/fscache.c         | 191 ++++++++++++++++++---------------------
 fs/nfs/fscache.h         |  77 ++++++++--------
 fs/nfs/inode.c           |   8 +-
 fs/nfs/internal.h        |  10 +-
 fs/nfs/pagelist.c        |  14 +++
 fs/nfs/pnfs.c            |  12 +--
 fs/nfs/read.c            | 117 ++++++++----------------
 fs/nfs/write.c           |   2 +-
 include/linux/nfs_fs.h   |  19 +---
 include/linux/nfs_page.h |   1 +
 include/linux/nfs_xdr.h  |   1 +
 14 files changed, 210 insertions(+), 247 deletions(-)

-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

