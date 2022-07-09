Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9449B57FD14
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658743791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YDdw2/4SJKX0XXZ9N0d05vKElttrx2DMN6EonNyENUs=;
	b=USJ09qMWIh7R3TG3TIOgE7kleR2EhAfIx521nBQmfI5o8XGHM91dPAb3nPHX4lDrfJO+Gh
	VGf1tEFV2tO2q3Sv7Fz1Jn45QGkfchiqmXyo8CUyQOiDVMCAWN5z4UhH1GDzLWBWbDnG3f
	QZsc7uqPm91rG77hlr9azwV8yJBqlQc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-BuB7iltuONmYhmpIcF0mFA-1; Mon, 25 Jul 2022 06:09:48 -0400
X-MC-Unique: BuB7iltuONmYhmpIcF0mFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCE13C0E206;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3702DC27DB3;
	Mon, 25 Jul 2022 10:09:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 489D31945DAA;
	Mon, 25 Jul 2022 10:09:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC1601947040 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  9 Jul 2022 10:07:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FA9918EBB; Sat,  9 Jul 2022 10:07:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA5F18EB9
 for <linux-cachefs@redhat.com>; Sat,  9 Jul 2022 10:07:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD58803520
 for <linux-cachefs@redhat.com>; Sat,  9 Jul 2022 10:07:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-bK2bNAH9Pq6MLEKlLNJ9PQ-1; Sat, 09 Jul 2022 06:07:42 -0400
X-MC-Unique: bK2bNAH9Pq6MLEKlLNJ9PQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16FDC60EFD;
 Sat,  9 Jul 2022 10:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAE2C341C7;
 Sat,  9 Jul 2022 10:07:39 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oA7N9-004EGQ-BD;
 Sat, 09 Jul 2022 11:07:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Sat,  9 Jul 2022 11:07:13 +0100
Message-Id: <cover.1657360984.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Mon, 25 Jul 2022 10:09:45 +0000
Subject: [Linux-cachefs] [PATCH v3 00/21] Update Documentation/ cross
 references and fix issues
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-cachefs@redhat.com, kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Alexander Potapenko <glider@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>,
 Mike Leach <mike.leach@linaro.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Marco Elver <elver@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-can@vger.kernel.org, Max Staudt <max@enpas.org>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 linux-sgx@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Leo Yan <leo.yan@linaro.org>,
 linux-fsdevel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series fix almost all fixable issues when building the html docs at
linux-next (next-20220608):

- Address some broken cross-references;
- Fix kernel-doc warnings;
- Fix bad tags on ReST files.

With this series applied, plus other pending patches that should hopefully
be merged in time for the next merge window, htmldocs build will produce
just 4 warnings with Sphinx 2.4.4.

Sphinx >=3 will produce some extra false-positive warnings due to conflicts
between structs and functions sharing the same name. Hopefully this will
be fixed either on a new Sphinx 5.x version or Sphinx 6.0.

Mauro Carvalho Chehab (21):
  docs: networking: update netdevices.rst reference
  docs: update vmalloced-kernel-stacks.rst reference
  docs: update vmemmap_dedup.rst reference
  docs: zh_CN: page_migration: fix reference to mm index.rst
  dt-bindings: arm: update arm,coresight-cpu-debug.yaml reference
  x86/sgx: fix kernel-doc markups
  fscache: fix kernel-doc documentation
  fs: namei: address some kernel-doc issues
  drm/scheduler: fix a kernel-doc warning
  drm/scheduler: add a missing kernel-doc parameter
  kfence: fix a kernel-doc parameter
  genalloc: add a description for start_addr parameter
  textsearch: document list inside struct ts_ops
  dcache: fix a kernel-doc warning
  docs: ext4: blockmap.rst: fix a broken table
  docs: PCI: pci-vntb-function.rst: Properly include ascii artwork
  docs: PCI: pci-vntb-howto.rst: fix a title markup
  docs: virt: kvm: fix a title markup at api.rst
  docs: ABI: sysfs-bus-nvdimm
  docs: leds: index.rst: add leds-qcom-lpg to it
  Documentation: coresight: fix binding wildcards

 Documentation/ABI/testing/sysfs-bus-nvdimm             |  2 ++
 Documentation/PCI/endpoint/pci-vntb-function.rst       |  2 +-
 Documentation/PCI/endpoint/pci-vntb-howto.rst          |  2 +-
 Documentation/filesystems/ext4/blockmap.rst            |  2 +-
 Documentation/leds/index.rst                           |  1 +
 Documentation/trace/coresight/coresight-cpu-debug.rst  |  2 +-
 Documentation/trace/coresight/coresight.rst            |  2 +-
 Documentation/translations/zh_CN/mm/page_migration.rst |  2 +-
 .../translations/zh_CN/mm/vmalloced-kernel-stacks.rst  |  2 +-
 Documentation/virt/kvm/api.rst                         |  6 +++---
 arch/x86/include/uapi/asm/sgx.h                        | 10 ++++++++--
 drivers/gpu/drm/scheduler/sched_main.c                 |  1 +
 drivers/net/can/can327.c                               |  2 +-
 fs/namei.c                                             |  3 +++
 include/drm/gpu_scheduler.h                            |  1 +
 include/linux/dcache.h                                 |  2 +-
 include/linux/fscache.h                                |  4 ++--
 include/linux/genalloc.h                               |  1 +
 include/linux/kfence.h                                 |  1 +
 include/linux/textsearch.h                             |  1 +
 mm/hugetlb_vmemmap.h                                   |  2 +-
 21 files changed, 34 insertions(+), 17 deletions(-)

-- 
2.36.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

