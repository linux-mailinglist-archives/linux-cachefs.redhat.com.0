Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9051B59848A
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830378;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hM3KRoyrmNDEUskG+WhmI2vT8DYC/Wiag08KxTa3IOI=;
	b=WyKKDQAnliRk92mxqJ5eJnDR+ov6A6cn1FuBkxzYFHIN5jrNQ2ZO+T33R29Qyt0vaB7UGy
	Nc8L0Z3SBr6IazY8+rdFatSXi0Ycg67MxqvfuAYm+CZ5hGOQwz4T10puDdXAZye/YyG7if
	2bGg2J+ZXHQqJD84Uyg5tY8tcoD3yko=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-gbA5Vit3PP6syFoOPBBfjg-1; Thu, 18 Aug 2022 09:46:15 -0400
X-MC-Unique: gbA5Vit3PP6syFoOPBBfjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B205F293248E;
	Thu, 18 Aug 2022 13:46:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A782C1121319;
	Thu, 18 Aug 2022 13:46:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F5CE194E127;
	Thu, 18 Aug 2022 13:46:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2C491946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:46:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93F3C492CA6; Thu, 18 Aug 2022 13:46:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 906C8492CA5
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:46:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 798FA101A586
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:46:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-KbSv1tySNnajypGoAT6c2g-1; Thu, 18 Aug 2022 09:46:10 -0400
X-MC-Unique: KbSv1tySNnajypGoAT6c2g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1539161668;
 Thu, 18 Aug 2022 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AFDC433C1;
 Thu, 18 Aug 2022 13:39:07 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oOfjl-00AY7B-0o;
 Thu, 18 Aug 2022 15:39:05 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	corbet@lwn.net
Date: Thu, 18 Aug 2022 15:38:46 +0200
Message-Id: <cover.1660829433.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 00/13] Fix documentation build warnings
 against 6.0-rc1
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
Cc: Kosuke Fujimoto <fujimotokosuke0@gmail.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Akira Yokosawa <akiyks@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Alex Shi <alexs@kernel.org>,
 Rob Herring <robh@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-cachefs@redhat.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ilya Dryomov <idryomov@gmail.com>,
 Mike Leach <mike.leach@linaro.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Madhavan Srinivasan <maddy@in.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Kajol Jain <kjain@linux.ibm.com>,
 coresight@lists.linaro.org, Wu XiangCheng <bobwxc@email.cn>,
 Tsugikazu Shibata <shibata@linuxfoundation.org>,
 Yanteng Si <siyanteng@loongson.cn>, Muchun Song <songmuchun@bytedance.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Leo Yan <leo.yan@linaro.org>,
 Jiri Kosina <jkosina@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jon,

This series is against 6.0-rc1, so it should apply fine on the top of your tree.

After applying one fix sent to ACPI:

https://lore.kernel.org/linux-acpi/20220818055156.7456-1-sakari.ailus@linux.intel.com/T/#u

make htmldocs (with Sphinx 2.4.4) produces a very clean result:
:

	Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703
-regulator.yaml references a file that doesn't exist: Documentation/devicetree/b
indings/mfd/siliconmitus,sm5703.yaml
	  SPHINX  htmldocs --> file:///new_devel/v4l/docs/Documentation/output
	  PARSE   include/uapi/linux/dvb/ca.h
	  PARSE   include/uapi/linux/dvb/dmx.h
	  PARSE   include/uapi/linux/dvb/frontend.h
	  PARSE   include/uapi/linux/dvb/net.h
	  PARSE   include/uapi/linux/videodev2.h
	  PARSE   include/uapi/linux/media.h
	  PARSE   include/uapi/linux/cec.h
	  PARSE   include/uapi/linux/lirc.h
	Using sphinx_rtd_theme theme

The only warning is due to a driver that got its upstream way for MFD, but it seems that
the corresponding regulator driver has lost its way.

If we can fix such warning, we could add a sort of "Werror" for:

	- some ABI issues;
	- kernel-doc warnings/errors;
	- broken kernel-doc warnings.

Although there will still have Sphinx warnings that can come up from various sources,
this could help to keep documentation on a better shape, as time goes by.

Regards,
Mauro


Mauro Carvalho Chehab (13):
  scripts: kernel-doc: add support for EXPORT_SYMBOL variants
  docs: update vmemmap_dedup.rst reference
  docs: ja_JP: remove SubmittingPatches
  docs: zh_CN: remove references to rust documentation
  dt-bindings: arm: update arm,coresight-cpu-debug.yaml reference
  Documentation: coresight: fix a documentation build warning
  MAINTAINERS: fix wildcard for mfd da90* files
  MAINTAINERS: fix a typo for hpe,gxp-spifi.yaml
  ABI: sysfs-bus-nvdimm: fix a doc build warning
  docs: leds: add leds-qcom-lpg.rst to the index file
  fscache: fix kernel-doc markup on two functions
  serial: document start_rx member at struct uart_ops
  fs/dcache: fix a kernel-doc markup

 Documentation/ABI/testing/sysfs-bus-nvdimm    |   2 +
 Documentation/leds/index.rst                  |   1 +
 .../trace/coresight/coresight-cpu-debug.rst   |   2 +-
 Documentation/trace/coresight/coresight.rst   |   2 +-
 .../translations/ja_JP/SubmittingPatches      | 722 ------------------
 .../zh_CN/doc-guide/kernel-doc.rst            |   2 -
 MAINTAINERS                                   |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c        |   1 +
 include/drm/gpu_scheduler.h                   |   1 +
 include/linux/dcache.h                        |  10 +-
 include/linux/fscache.h                       |   4 +-
 include/linux/serial_core.h                   |   8 +
 mm/hugetlb_vmemmap.h                          |   2 +-
 scripts/kernel-doc                            |   8 +-
 14 files changed, 33 insertions(+), 736 deletions(-)
 delete mode 100644 Documentation/translations/ja_JP/SubmittingPatches

-- 
2.37.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

