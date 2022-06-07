Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55025542159
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Jun 2022 07:51:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-62Qh7R9pOy2BPIHCMmERqQ-1; Wed, 08 Jun 2022 01:51:52 -0400
X-MC-Unique: 62Qh7R9pOy2BPIHCMmERqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62F83101E986;
	Wed,  8 Jun 2022 05:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C37118EA1;
	Wed,  8 Jun 2022 05:51:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F1071947B9E;
	Wed,  8 Jun 2022 05:51:50 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7976519452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  7 Jun 2022 14:18:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67631400F3FF; Tue,  7 Jun 2022 14:18:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B4E400F3E9
 for <linux-cachefs@redhat.com>; Tue,  7 Jun 2022 14:18:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B6AE8DD605
 for <linux-cachefs@redhat.com>; Tue,  7 Jun 2022 14:18:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-_r2IQudKPxupM6Ms2Y4xSA-1; Tue, 07 Jun 2022 10:18:41 -0400
X-MC-Unique: _r2IQudKPxupM6Ms2Y4xSA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E794A61579;
 Tue,  7 Jun 2022 14:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A53C385A5;
 Tue,  7 Jun 2022 14:11:37 +0000 (UTC)
From: Mark Brown <broonie@kernel.org>
To: linux-doc@vger.kernel.org, corbet@lwn.net, mchehab@kernel.org
In-Reply-To: <cover.1654529011.git.mchehab@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
Message-Id: <165461109692.1597191.11390741473240531333.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 15:11:36 +0100
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Wed, 08 Jun 2022 05:51:48 +0000
Subject: Re: [Linux-cachefs] (subset) [PATCH 00/23] Update Documentation/
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
Cc: ulf.hansson@linaro.org, alim.akhtar@samsung.com, kvm@vger.kernel.org,
 rafael@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 alsa-devel@alsa-project.org, keyrings@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hpa@zytor.com,
 linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 mchehab+huawei@kernel.org, x86@kernel.org, linux-cachefs@redhat.com,
 geert@linux-m68k.org, federico.vaga@vaga.pv.it,
 bcm-kernel-feedback-list@broadcom.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, jdelvare@suse.com, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 robh+dt@kernel.org, bp@alien8.de, mmayer@broadcom.com, tglx@linutronix.de,
 mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, jarkko@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 6 Jun 2022 16:25:22 +0100, Mauro Carvalho Chehab wrote:
> There were a number of DT binding conversions and other docs change that
> were not updated. Address them, in order to keep the cross-references on
> a sane state.
> 
> Patch series is against v5.19-rc1 (and applies cleanly on the top of
> today's -next).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[22/23] ASoC: wm8731: update wlf,wm8731.yaml reference
        commit: 69c8027c5ff43d68449fda4510a8cce70e8578b0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

