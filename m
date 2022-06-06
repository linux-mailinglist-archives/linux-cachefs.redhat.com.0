Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC054215C
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Jun 2022 07:51:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-0sIf3CrAOnm5Dr42Or3ZhQ-1; Wed, 08 Jun 2022 01:51:52 -0400
X-MC-Unique: 0sIf3CrAOnm5Dr42Or3ZhQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 627451C04B47;
	Wed,  8 Jun 2022 05:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0849401E5C;
	Wed,  8 Jun 2022 05:51:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94430194704C;
	Wed,  8 Jun 2022 05:51:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14451194706E for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 15:33:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F1339492CA4; Mon,  6 Jun 2022 15:33:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF4A492CA3
 for <linux-cachefs@redhat.com>; Mon,  6 Jun 2022 15:33:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 306FB8339A9
 for <linux-cachefs@redhat.com>; Mon,  6 Jun 2022 15:33:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-r6oFb1w5N-K0lf_n12_gRQ-1; Mon, 06 Jun 2022 11:33:39 -0400
X-MC-Unique: r6oFb1w5N-K0lf_n12_gRQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84DF061559;
 Mon,  6 Jun 2022 15:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9A7C341DE;
 Mon,  6 Jun 2022 15:25:49 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1nyEby-0012On-0x;
 Mon, 06 Jun 2022 16:25:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Mon,  6 Jun 2022 16:25:22 +0100
Message-Id: <cover.1654529011.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Wed, 08 Jun 2022 05:51:48 +0000
Subject: [Linux-cachefs] [PATCH 00/23] Update Documentation/ cross-references
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 kvm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, alsa-devel@alsa-project.org,
 keyrings@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Markus Mayer <mmayer@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-cachefs@redhat.com, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi John,

There were a number of DT binding conversions and other docs change that
were not updated. Address them, in order to keep the cross-references on
a sane state.

Patch series is against v5.19-rc1 (and applies cleanly on the top of
today's -next).

Mauro Carvalho Chehab (23):
  dt-bindings: mfd: bd9571mwv: update rohm,bd9571mwv.yaml reference
  dt-bindings: interrupt-controller: update brcm,l2-intc.yaml reference
  dt-bindings: arm: update vexpress-config.yaml references
  dt-bindings: reset: update st,stih407-powerdown.yaml references
  dt-bindings: mfd: rk808: update rockchip,rk808.yaml reference
  dt-bindings: mmc: exynos-dw-mshc: update samsung,pinctrl.yaml
    reference
  docs: netdev: update maintainer-netdev.rst reference
  docs: filesystems: update netfs-api.rst reference
  Documentation: update watch_queue.rst references
  Documentation: KVM: update s390-pv.rst reference
  Documentation: KVM: update amd-memory-encryption.rst references
  Documentation: KVM: update msr.rst reference
  Documentation: KVM: update s390-diag.rst reference
  MAINTAINERS: update arm,hdlcd.yaml reference
  MAINTAINERS: update arm,komeda.yaml reference
  MAINTAINERS: update arm,malidp.yaml reference
  MAINTAINERS: update cortina,gemini-ethernet.yaml reference
  MAINTAINERS: update dongwoon,dw9807-vcm.yaml reference
  MAINTAINERS: update maxim,max77693.yaml reference
  MAINTAINERS: update snps,axs10x-reset.yaml reference
  objtool: update objtool.txt references
  ASoC: wm8731: update wlf,wm8731.yaml reference
  arch: m68k: q40: README: drop references to IDE driver

 .../ABI/testing/sysfs-driver-bd9571mwv-regulator   |  2 +-
 Documentation/admin-guide/kernel-parameters.txt    |  2 +-
 .../bindings/cpufreq/brcm,stb-avs-cpu-freq.txt     |  2 +-
 .../devicetree/bindings/hwmon/vexpress.txt         |  2 +-
 .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |  2 +-
 .../devicetree/bindings/phy/phy-stih407-usb.txt    |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-rk805.txt  |  2 +-
 .../devicetree/bindings/regulator/vexpress.txt     |  2 +-
 .../bindings/sound/atmel-sam9x5-wm8731-audio.txt   |  2 +-
 Documentation/devicetree/bindings/usb/dwc3-st.txt  |  2 +-
 Documentation/devicetree/bindings/usb/ehci-st.txt  |  2 +-
 Documentation/devicetree/bindings/usb/ohci-st.txt  |  2 +-
 Documentation/security/keys/core.rst               |  2 +-
 Documentation/security/secrets/coco.rst            |  2 +-
 .../translations/it_IT/networking/netdev-FAQ.rst   |  2 +-
 Documentation/virt/kvm/api.rst                     |  4 ++--
 Documentation/virt/kvm/s390/s390-pv-boot.rst       |  2 +-
 Documentation/virt/kvm/x86/hypercalls.rst          |  2 +-
 Documentation/x86/orc-unwinder.rst                 |  2 +-
 MAINTAINERS                                        | 14 +++++++-------
 arch/m68k/q40/README                               |  4 +---
 include/linux/fscache.h                            |  2 +-
 include/linux/objtool.h                            |  2 +-
 include/linux/watch_queue.h                        |  2 +-
 init/Kconfig                                       |  2 +-
 kernel/watch_queue.c                               |  2 +-
 lib/Kconfig.debug                                  |  2 +-
 tools/include/linux/objtool.h                      |  2 +-
 tools/objtool/check.c                              |  2 +-
 29 files changed, 36 insertions(+), 38 deletions(-)

-- 
2.36.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

