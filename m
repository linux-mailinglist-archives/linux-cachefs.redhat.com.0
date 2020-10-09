Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8A1289C68
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Oct 2020 01:55:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-pYEV6YsEMCCBec7Vz-OmuQ-1; Fri, 09 Oct 2020 19:55:10 -0400
X-MC-Unique: pYEV6YsEMCCBec7Vz-OmuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257B7425FD;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1386176660;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 002401832FDD;
	Fri,  9 Oct 2020 23:55:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqvRU020206 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58F0E13BB95; Fri,  9 Oct 2020 19:52:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5312213BB94
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:52:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AE7D800883
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:52:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-39-ilWXQRetMx2ymOuGpivksg-1; 
	Fri, 09 Oct 2020 15:52:52 -0400
X-MC-Unique: ilWXQRetMx2ymOuGpivksg-1
IronPort-SDR: +WLWQ1Fi/F6i99G7oZsRP2RdazP9mx1GzvnRSLP8KMXMBadPVd9k4TqZuGwVYkFO0Jp1nlAfn4
	/aalKs/+ILrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="164743970"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="164743970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:52:50 -0700
IronPort-SDR: raa31ON9t7yf3LIgfzeAsEKPUCppaesVfvBVJ2ruufMJvWsy9JzU1jTdgl2++U0w8tR7AuyOxm
	Q4+3OjaqYbiw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="298531317"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga008-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:09 -0700
Message-Id: <20201009195033.3208459-35-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 09 Oct 2020 19:54:52 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
	linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, Gao Xiang <xiang@kernel.org>,
	linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, Chao Yu <chao@kernel.org>,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH RFC PKS/PMEM 34/58] fs/erofs: Utilize new
	kmap_thread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Gao Xiang <xiang@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/erofs/super.c | 4 ++--
 fs/erofs/xattr.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ddaa516c008a..41696b60f1b3 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -139,7 +139,7 @@ static int erofs_read_superblock(struct super_block *sb)
 
 	sbi = EROFS_SB(sb);
 
-	data = kmap(page);
+	data = kmap_thread(page);
 	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
 
 	ret = -EINVAL;
@@ -189,7 +189,7 @@ static int erofs_read_superblock(struct super_block *sb)
 	}
 	ret = 0;
 out:
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 	return ret;
 }
diff --git a/fs/erofs/xattr.c b/fs/erofs/xattr.c
index c8c381eadcd6..1771baa99d77 100644
--- a/fs/erofs/xattr.c
+++ b/fs/erofs/xattr.c
@@ -20,7 +20,7 @@ static inline void xattr_iter_end(struct xattr_iter *it, bool atomic)
 {
 	/* the only user of kunmap() is 'init_inode_xattrs' */
 	if (!atomic)
-		kunmap(it->page);
+		kunmap_thread(it->page);
 	else
 		kunmap_atomic(it->kaddr);
 
@@ -96,7 +96,7 @@ static int init_inode_xattrs(struct inode *inode)
 	}
 
 	/* read in shared xattr array (non-atomic, see kmalloc below) */
-	it.kaddr = kmap(it.page);
+	it.kaddr = kmap_thread(it.page);
 	atomic_map = false;
 
 	ih = (struct erofs_xattr_ibody_header *)(it.kaddr + it.ofs);
-- 
2.28.0.rc0.12.gb6a658bd00c9

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

