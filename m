Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E778E289C61
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Oct 2020 01:55:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-2zgiDRlJOKyMC_WvKOYM0g-1; Fri, 09 Oct 2020 19:55:11 -0400
X-MC-Unique: 2zgiDRlJOKyMC_WvKOYM0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EEC78070F5;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D9477666C;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09A0B1832FE0;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JrPPQ020360 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AB052166BD9; Fri,  9 Oct 2020 19:53:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D9D2166BA0
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:53:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21A31858294
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:53:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-588-2PaBcbkbNPuZT8U_SJ6WfQ-1;
	Fri, 09 Oct 2020 15:53:20 -0400
X-MC-Unique: 2PaBcbkbNPuZT8U_SJ6WfQ-1
IronPort-SDR: lP0pASfRiMULeeEa4Ysk0ah3DiC3FQK83fCRTA6/g6d5AboHPoWE2PsVfgtc2VUMi70qZjsjMo
	YYgnBuI5zUuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="250226272"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="250226272"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:19 -0700
IronPort-SDR: W4xxziDMxkncUnjnfmhtERgTle+fDEBI/syTBEG/tlt++YK2v+9/w8FvvM36z1FzCpPIzrEgyR
	3zBS2pDk0hzg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="354959339"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga003-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:18 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:17 -0700
Message-Id: <20201009195033.3208459-43-ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH RFC PKS/PMEM 42/58] drivers/scsi: Utilize
	new kmap_thread()
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

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/scsi/ipr.c     | 8 ++++----
 drivers/scsi/pmcraid.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index b0aa58d117cc..a5a0b8feb661 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -3923,9 +3923,9 @@ static int ipr_copy_ucode_buffer(struct ipr_sglist *sglist,
 			buffer += bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		memcpy(kaddr, buffer, bsize_elem);
-		kunmap(page);
+		kunmap_thread(page);
 
 		sg->length = bsize_elem;
 
@@ -3938,9 +3938,9 @@ static int ipr_copy_ucode_buffer(struct ipr_sglist *sglist,
 	if (len % bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		memcpy(kaddr, buffer, len % bsize_elem);
-		kunmap(page);
+		kunmap_thread(page);
 
 		sg->length = len % bsize_elem;
 	}
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index aa9ae2ae8579..4b05ba4b8a11 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -3269,13 +3269,13 @@ static int pmcraid_copy_sglist(
 	for (i = 0; i < (len / bsize_elem); i++, sg = sg_next(sg), buffer += bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		if (direction == DMA_TO_DEVICE)
 			rc = copy_from_user(kaddr, buffer, bsize_elem);
 		else
 			rc = copy_to_user(buffer, kaddr, bsize_elem);
 
-		kunmap(page);
+		kunmap_thread(page);
 
 		if (rc) {
 			pmcraid_err("failed to copy user data into sg list\n");
@@ -3288,14 +3288,14 @@ static int pmcraid_copy_sglist(
 	if (len % bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 
 		if (direction == DMA_TO_DEVICE)
 			rc = copy_from_user(kaddr, buffer, len % bsize_elem);
 		else
 			rc = copy_to_user(buffer, kaddr, len % bsize_elem);
 
-		kunmap(page);
+		kunmap_thread(page);
 
 		sg->length = len % bsize_elem;
 	}
-- 
2.28.0.rc0.12.gb6a658bd00c9

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

