Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD05A3FA0
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 Aug 2022 22:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661719165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qa8GGYbAd2xrArO2UKvJ8utrby9FyP7Fa8R7BYiRnZc=;
	b=G4vsRg34jHUbvYC3mvMQXILXE+TdiY1UmwWrKXkw2/KdVVfKQ8IBhsYol4R+LSlqPSRTXg
	tWX0D1T1A1Tb9iWouScdTXabE3kdxppU1bVAmEvfLLdmnb0hNTOS2I5MfnvA+t14dkW75O
	Y8f7P6RJvTrIBabhUmyvgvSUaq4NE64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-A6MCaaLIP8m08Pj-EyRn2A-1; Sun, 28 Aug 2022 16:39:22 -0400
X-MC-Unique: A6MCaaLIP8m08Pj-EyRn2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D65C85A589;
	Sun, 28 Aug 2022 20:39:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8D040D282E;
	Sun, 28 Aug 2022 20:39:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8270D1946A4A;
	Sun, 28 Aug 2022 20:39:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 202751946A45 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 01AD44010D43; Sun, 28 Aug 2022 20:39:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A256340C141D;
 Sun, 28 Aug 2022 20:39:14 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Sun, 28 Aug 2022 16:39:10 -0400
Message-Id: <20220828203913.956306-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [RFC PATCH v2 0/3] Convert NFS with fscache to the
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset converts NFS with fscache non-direct READ IO paths to
use the netfs API with a non-invasive approach.  The existing NFS pgio
layer does not need extensive changes, and is the best way so far I've
found to address Trond's concerns about modifying the IO path [1] as
well as only enabling netfs when fscache is configured and enabled [2].
I have not yet attempted performance comparisions to address Chuck
Lever's concern [3], though this is probably less of a concern now,
since netfs is not used unless fscache is configured and enabled.

The main patch to be reviewed is patch #3 which converts nfs_read_folio
and nfs_readahead.

Changes since v1
- PATCH 2,3: #ifdef CONFIG_NFS_FSCACHE all netfs bits
- PATCH 3: Minimize changes to nfs_read_folio
- PATCH 3: Add spinlock around updating of RPC accounting info inside
  nfs_complete_read (this resolved previous hang issue #3 on generic/075)

The patches are moving in the right direction, and is the best I have
come up with so far to move things forward.  The patches are fairly
stable as evidenced with xfstests generic with various servers.  The
known issues are as follows:

1. Unit test setting rsize < readahead does not properly read from
fscache but re-reads data from the NFS server
* This will be fixed once another linux-cachefs [4] patch to resolve
"Stop read optimisation when folio removed from pagecache"

2. "Cache volume key already in use" after xfstest runs
* xfstests (hammerspace with vers=4.2,fsc) shows the following on the
console after some tests:
"NFS: Cache volume key already in use (nfs,4.1,2,c50,cfe0100a,3,,,8000,100000,100000,bb8,ea60,7530,ea60,1)"
* This may be fixed with another patch [4] that is in progress

3. Hang with xfstests involving directIO writes + reads
* seen with NFSv4.1, NetApp (ontap9) NFS server
* seen one time with generic/209, one time with generic/451
* root of the problem is the added netfs RPC accounting is not
handling read errors such as BAD_STATEID properly; might need
to move the logic to anothe location such as 
nfs_initiate_read() and nfs_readpage_done()

4. Data corruption seen with unit test where rsize < readahead
* Seen with vanilla 6.0-rc2 (did not occur on 5.19); likely unrelated
to this patchset
 mount -o vers=4.2,fsc,rsize=8192 127.0.0.1:/export /mnt
 dd if=/dev/urandom of=/tmp/integrity-rsize-file1.bin bs=16k count=1
 ./nfs-readahead.sh set /mnt 16384
 dd if=/tmp/integrity-rsize-file1.bin of=/mnt/integrity-rsize-file1.bin bs=16k count=1
 echo 3 > /proc/sys/vm/drop_caches
 md5sum /mnt/integrity-rsize-file1.bin /tmp/integrity-rsize-file1.bin
 md5sums don't match, MD5_NFS = 00eaf1a5bc1b3dfd54711db551619afa != MD5_LOCAL = e8d835c83ba1f1264869dc40673fa20c

The patchset is based on 6.0-rc2 and has been pushed to github at:
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

