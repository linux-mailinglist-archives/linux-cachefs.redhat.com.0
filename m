Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1D9289C62
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Oct 2020 01:55:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251--JFanci4PLqZbLne6C9wPg-1; Fri, 09 Oct 2020 19:55:11 -0400
X-MC-Unique: -JFanci4PLqZbLne6C9wPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DDA18064BA;
	Fri,  9 Oct 2020 23:55:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9477512E;
	Fri,  9 Oct 2020 23:55:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 087C01832FDA;
	Fri,  9 Oct 2020 23:55:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqnQi020138 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BCB0207A813; Fri,  9 Oct 2020 19:52:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 066F7207AC2C
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:52:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2126805C1B
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:52:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-540-w0Pn2tBcPJuGCp94Tv5JwQ-1;
	Fri, 09 Oct 2020 15:52:46 -0400
X-MC-Unique: w0Pn2tBcPJuGCp94Tv5JwQ-1
IronPort-SDR: 7UchEJIm7/3/4RJ+kCt9ApcBOrgYWXLpXF7RbNbc+AT0skyuPqK1d7wh51knnPECGuos+5jTbr
	lrmBHPYTEYEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="144850719"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="144850719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:42 -0700
IronPort-SDR: /JTFkd5x0991ia3Dqzqc9DQMEj3VkzRKrzcEaYc1Uf7R2BILbYJ/fow/WUSSa3njc7c47Zr56l
	AjDrFCZ0Z24A==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="389236880"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga001-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:41 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:50 -0700
Message-Id: <20201009195033.3208459-16-ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 09 Oct 2020 19:54:52 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>, kexec@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	Aditya Pakki <pakki001@umn.edu>, linux-mmc@vger.kernel.org,
	linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, xen-devel@lists.xenproject.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH RFC PKS/PMEM 15/58] fs/ecryptfs: Utilize new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@google.com>
Cc: Aditya Pakki <pakki001@umn.edu>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ecryptfs/crypto.c     | 8 ++++----
 fs/ecryptfs/read_write.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 0681540c48d9..e73e00994bee 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -469,10 +469,10 @@ int ecryptfs_encrypt_page(struct page *page)
 	}
 
 	lower_offset = lower_offset_for_page(crypt_stat, page);
-	enc_extent_virt = kmap(enc_extent_page);
+	enc_extent_virt = kmap_thread(enc_extent_page);
 	rc = ecryptfs_write_lower(ecryptfs_inode, enc_extent_virt, lower_offset,
 				  PAGE_SIZE);
-	kunmap(enc_extent_page);
+	kunmap_thread(enc_extent_page);
 	if (rc < 0) {
 		ecryptfs_printk(KERN_ERR,
 			"Error attempting to write lower page; rc = [%d]\n",
@@ -518,10 +518,10 @@ int ecryptfs_decrypt_page(struct page *page)
 	BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
 
 	lower_offset = lower_offset_for_page(crypt_stat, page);
-	page_virt = kmap(page);
+	page_virt = kmap_thread(page);
 	rc = ecryptfs_read_lower(page_virt, lower_offset, PAGE_SIZE,
 				 ecryptfs_inode);
-	kunmap(page);
+	kunmap_thread(page);
 	if (rc < 0) {
 		ecryptfs_printk(KERN_ERR,
 			"Error attempting to read lower page; rc = [%d]\n",
diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index 0438997ac9d8..5eca4330c0c0 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -64,11 +64,11 @@ int ecryptfs_write_lower_page_segment(struct inode *ecryptfs_inode,
 
 	offset = ((((loff_t)page_for_lower->index) << PAGE_SHIFT)
 		  + offset_in_page);
-	virt = kmap(page_for_lower);
+	virt = kmap_thread(page_for_lower);
 	rc = ecryptfs_write_lower(ecryptfs_inode, virt, offset, size);
 	if (rc > 0)
 		rc = 0;
-	kunmap(page_for_lower);
+	kunmap_thread(page_for_lower);
 	return rc;
 }
 
@@ -251,11 +251,11 @@ int ecryptfs_read_lower_page_segment(struct page *page_for_ecryptfs,
 	int rc;
 
 	offset = ((((loff_t)page_index) << PAGE_SHIFT) + offset_in_page);
-	virt = kmap(page_for_ecryptfs);
+	virt = kmap_thread(page_for_ecryptfs);
 	rc = ecryptfs_read_lower(virt, offset, size, ecryptfs_inode);
 	if (rc > 0)
 		rc = 0;
-	kunmap(page_for_ecryptfs);
+	kunmap_thread(page_for_ecryptfs);
 	flush_dcache_page(page_for_ecryptfs);
 	return rc;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

