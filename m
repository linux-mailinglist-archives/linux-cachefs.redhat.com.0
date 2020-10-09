Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE334289C6A
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Oct 2020 01:55:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-vv0orYy6OBuHGA2v2-XT9g-1; Fri, 09 Oct 2020 19:55:12 -0400
X-MC-Unique: vv0orYy6OBuHGA2v2-XT9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F17918A077D;
	Fri,  9 Oct 2020 23:55:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EFED5C1BB;
	Fri,  9 Oct 2020 23:55:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BA021832FD2;
	Fri,  9 Oct 2020 23:55:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JroPg020624 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0725207ABFC; Fri,  9 Oct 2020 19:53:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E36207AD3A
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:53:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F11D182360E
	for <linux-cachefs@redhat.com>; Fri,  9 Oct 2020 19:53:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-520-p2HVLCfDMm2JUOSmFo0EKQ-1; Fri, 09 Oct 2020 15:53:43 -0400
X-MC-Unique: p2HVLCfDMm2JUOSmFo0EKQ-1
IronPort-SDR: pAM5hSnj+2hnn3bgPcqCFjABdy/qZENE5ZvyNlvthRNkz6QTPRLlzNx7E99ByAQDQu3i15/uBu
	ayb9T0zEtzgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="229715364"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="229715364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:41 -0700
IronPort-SDR: t/zSGeR++7wfj+VtFM7nhfyp5h0blfdWqDlNHnP/5jl48Bm08GFuTiLpDu6MwkEQ7bZpMY8SQr
	l7ztZVCdgy3g==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419537249"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga001-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:40 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:24 -0700
Message-Id: <20201009195033.3208459-50-ira.weiny@intel.com>
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
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Linux-cachefs] [PATCH RFC PKS/PMEM 49/58] drivers/misc: Utilize
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 8531ae781195..f308abb8ad03 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -343,7 +343,7 @@ static int qp_memcpy_to_queue_iter(struct vmci_queue *queue,
 		size_t to_copy;
 
 		if (kernel_if->host)
-			va = kmap(kernel_if->u.h.page[page_index]);
+			va = kmap_thread(kernel_if->u.h.page[page_index]);
 		else
 			va = kernel_if->u.g.vas[page_index + 1];
 			/* Skip header. */
@@ -357,12 +357,12 @@ static int qp_memcpy_to_queue_iter(struct vmci_queue *queue,
 		if (!copy_from_iter_full((u8 *)va + page_offset, to_copy,
 					 from)) {
 			if (kernel_if->host)
-				kunmap(kernel_if->u.h.page[page_index]);
+				kunmap_thread(kernel_if->u.h.page[page_index]);
 			return VMCI_ERROR_INVALID_ARGS;
 		}
 		bytes_copied += to_copy;
 		if (kernel_if->host)
-			kunmap(kernel_if->u.h.page[page_index]);
+			kunmap_thread(kernel_if->u.h.page[page_index]);
 	}
 
 	return VMCI_SUCCESS;
@@ -391,7 +391,7 @@ static int qp_memcpy_from_queue_iter(struct iov_iter *to,
 		int err;
 
 		if (kernel_if->host)
-			va = kmap(kernel_if->u.h.page[page_index]);
+			va = kmap_thread(kernel_if->u.h.page[page_index]);
 		else
 			va = kernel_if->u.g.vas[page_index + 1];
 			/* Skip header. */
@@ -405,12 +405,12 @@ static int qp_memcpy_from_queue_iter(struct iov_iter *to,
 		err = copy_to_iter((u8 *)va + page_offset, to_copy, to);
 		if (err != to_copy) {
 			if (kernel_if->host)
-				kunmap(kernel_if->u.h.page[page_index]);
+				kunmap_thread(kernel_if->u.h.page[page_index]);
 			return VMCI_ERROR_INVALID_ARGS;
 		}
 		bytes_copied += to_copy;
 		if (kernel_if->host)
-			kunmap(kernel_if->u.h.page[page_index]);
+			kunmap_thread(kernel_if->u.h.page[page_index]);
 	}
 
 	return VMCI_SUCCESS;
-- 
2.28.0.rc0.12.gb6a658bd00c9

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

