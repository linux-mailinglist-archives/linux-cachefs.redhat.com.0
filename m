Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA855B089
	for <lists+linux-cachefs@lfdr.de>; Sun, 26 Jun 2022 11:11:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-_w31dhrNP4WnUc82TG9_gQ-1; Sun, 26 Jun 2022 05:11:21 -0400
X-MC-Unique: _w31dhrNP4WnUc82TG9_gQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B27A72806AAF;
	Sun, 26 Jun 2022 09:11:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18A5F40CF8E5;
	Sun, 26 Jun 2022 09:11:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65FED1947B92;
	Sun, 26 Jun 2022 09:11:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DCE581947040 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 26 Jun 2022 09:11:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CDADE141510C; Sun, 26 Jun 2022 09:11:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C99DA1415108
 for <linux-cachefs@redhat.com>; Sun, 26 Jun 2022 09:11:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B213F101A56C
 for <linux-cachefs@redhat.com>; Sun, 26 Jun 2022 09:11:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-I5VZ4ofENPyhGdK_oT91Kg-1; Sun, 26 Jun 2022 05:11:13 -0400
X-MC-Unique: I5VZ4ofENPyhGdK_oT91Kg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 904076119B;
 Sun, 26 Jun 2022 09:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65F3C341D0;
 Sun, 26 Jun 2022 09:11:10 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o5OIN-001coA-Qi;
 Sun, 26 Jun 2022 10:11:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Sun, 26 Jun 2022 10:10:46 +0100
Message-Id: <cover.1656234456.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH v2 00/20] Update Documentation/
 cross-references
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
Cc: kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 keyrings@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 linux-cachefs@redhat.com, Geert Uytterhoeven <geert@linux-m68k.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dipen Patel <dipenp@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix most broken documentation file cross references on next-20220624.

After this series, only 3 references will be broken:

Warning: Documentation/dev-tools/kunit/run_wrapper.rst references a file that doesn't exist: Documentation/dev-tools/kunit/non_uml.rst
Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
Warning: drivers/acpi/device_pm.c references a file that doesn't exist: Documentation/firmware-guide/acpi/low-power-probe.rst

All of them seem to be due to the lack of a patch actually adding the
documentation. Maybe the document file is still under review?

Regards,
Mauro

Mauro Carvalho Chehab (20):
  docs: netdev: update maintainer-netdev.rst reference
  docs: filesystems: update netfs-api.rst reference
  docs: zh_CN: page_frags.rst: fix a broken reference
  docs: zh_CN/riscv/pmu.rst: remove old docuementation
  docs: zh_CN/devicetree: fix typos
  docs: zh_CN: fix a broken reference
  docs: zh_CN/vm: fix a typo for page reporting ReST file
  docs: zh_CN/vm/zsmalloc.rst: fix a typo
  docs: zh_CN/vm/index.rst: fix a broken reference
  Documentation: update watch_queue.rst references
  Documentation: KVM: update s390-pv.rst reference
  Documentation: KVM: update amd-memory-encryption.rst references
  Documentation: KVM: update msr.rst reference
  Documentation: KVM: update s390-diag.rst reference
  objtool: update objtool.txt references
  arch: m68k: q40: README: drop references to IDE driver
  tegra194-hte.rst: fix reference to its binding
  dt-bindings: mfd: update dlg,da9063.yaml reference
  MAINTAINERS: update nvidia,tegra20-host1x.yaml reference
  MAINTAINERS: fix cross references to mfd/dlg,da9063.yaml

 .../admin-guide/kernel-parameters.txt         |   2 +-
 .../bindings/input/da9062-onkey.txt           |   2 +-
 Documentation/driver-api/hte/tegra194-hte.rst |   2 +-
 Documentation/security/keys/core.rst          |   2 +-
 Documentation/security/secrets/coco.rst       |   2 +-
 .../it_IT/networking/netdev-FAQ.rst           |   2 +-
 .../translations/zh_CN/devicetree/index.rst   |   2 +-
 .../zh_CN/devicetree/of_unittest.rst          |   2 +-
 .../zh_CN/devicetree/usage-model.rst          |   2 +-
 .../zh_CN/doc-guide/kernel-doc.rst            |   2 +-
 .../translations/zh_CN/riscv/index.rst        |   1 -
 .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
 .../zh_CN/vm/free_page_reporting.rst          |   2 +-
 .../translations/zh_CN/vm/frontswap.rst       |   2 +-
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 .../translations/zh_CN/vm/page_frags.rst      |   2 +-
 .../translations/zh_CN/vm/zsmalloc.rst        |   2 +-
 Documentation/virt/kvm/api.rst                |   4 +-
 Documentation/virt/kvm/s390/s390-pv-boot.rst  |   2 +-
 Documentation/virt/kvm/x86/hypercalls.rst     |   2 +-
 Documentation/x86/orc-unwinder.rst            |   2 +-
 MAINTAINERS                                   |   6 +-
 arch/m68k/q40/README                          |   5 +-
 include/linux/fscache.h                       |   2 +-
 include/linux/objtool.h                       |   2 +-
 include/linux/watch_queue.h                   |   2 +-
 init/Kconfig                                  |   2 +-
 kernel/watch_queue.c                          |   2 +-
 lib/Kconfig.debug                             |   2 +-
 tools/include/linux/objtool.h                 |   2 +-
 tools/objtool/check.c                         |   2 +-
 31 files changed, 33 insertions(+), 270 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst

-- 
2.36.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

