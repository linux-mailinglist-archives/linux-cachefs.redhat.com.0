Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE7289C7C
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Oct 2020 01:55:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-vvi-SUKdMoeEZwmIw6QV2Q-1; Fri, 09 Oct 2020 19:55:15 -0400
X-MC-Unique: vvi-SUKdMoeEZwmIw6QV2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A86D108445F;
	Fri,  9 Oct 2020 23:55:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF396EF7C;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB008922EC;
	Fri,  9 Oct 2020 23:55:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JrUpC020399 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA0D42157F26; Fri,  9 Oct 2020 19:53:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D042166BDB
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:53:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC7B81823608
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:53:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-143-MGlE52zONFOTel2YSthHWA-1;
	Fri, 09 Oct 2020 15:53:25 -0400
X-MC-Unique: MGlE52zONFOTel2YSthHWA-1
IronPort-SDR: K9Qgz++TPq7y8MVkIu6MX+wP7cdq+h+NlHe0bC9hE6xaI29lJD6BB+GeR3g+cCD2zSI82ljUtW
	sp1+z7eYUIDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="144851026"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="144851026"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:23 -0700
IronPort-SDR: 1WKybDcesSB1sLOn62ClPw5Oz5roBPmtIQsa1XcymP/Rm5On5MJ4hIzRHLHnwze0O/9dY0G7BT
	oI/HBaoknNhQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="355863255"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga007-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:21 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:18 -0700
Message-Id: <20201009195033.3208459-44-ira.weiny@intel.com>
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
Cc: linux-aio@kvack.org, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	Sascha Sommer <saschasommer@freenet.de>,
	linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
	samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
	ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH RFC PKS/PMEM 43/58] drivers/mmc: Utilize new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sascha Sommer <saschasommer@freenet.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/mmc/host/mmc_spi.c    | 4 ++--
 drivers/mmc/host/sdricoh_cs.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
index 18a850f37ddc..ab28e7103b8d 100644
--- a/drivers/mmc/host/mmc_spi.c
+++ b/drivers/mmc/host/mmc_spi.c
@@ -918,7 +918,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
 		}
 
 		/* allow pio too; we don't allow highmem */
-		kmap_addr = kmap(sg_page(sg));
+		kmap_addr = kmap_thread(sg_page(sg));
 		if (direction == DMA_TO_DEVICE)
 			t->tx_buf = kmap_addr + sg->offset;
 		else
@@ -950,7 +950,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
 		/* discard mappings */
 		if (direction == DMA_FROM_DEVICE)
 			flush_kernel_dcache_page(sg_page(sg));
-		kunmap(sg_page(sg));
+		kunmap_thread(sg_page(sg));
 		if (dma_dev)
 			dma_unmap_page(dma_dev, dma_addr, PAGE_SIZE, dir);
 
diff --git a/drivers/mmc/host/sdricoh_cs.c b/drivers/mmc/host/sdricoh_cs.c
index 76a8cd3a186f..7806bc69c4f1 100644
--- a/drivers/mmc/host/sdricoh_cs.c
+++ b/drivers/mmc/host/sdricoh_cs.c
@@ -312,11 +312,11 @@ static void sdricoh_request(struct mmc_host *mmc, struct mmc_request *mrq)
 			int result;
 			page = sg_page(data->sg);
 
-			buf = kmap(page) + data->sg->offset + (len * i);
+			buf = kmap_thread(page) + data->sg->offset + (len * i);
 			result =
 				sdricoh_blockio(host,
 					data->flags & MMC_DATA_READ, buf, len);
-			kunmap(page);
+			kunmap_thread(page);
 			flush_dcache_page(page);
 			if (result) {
 				dev_err(dev, "sdricoh_request: cmd %i "
-- 
2.28.0.rc0.12.gb6a658bd00c9

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

