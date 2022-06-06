Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAB54215D
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Jun 2022 07:51:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-1aRbAOoFMVGqnVjhKpGG_A-1; Wed, 08 Jun 2022 01:51:52 -0400
X-MC-Unique: 1aRbAOoFMVGqnVjhKpGG_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62E32101E985;
	Wed,  8 Jun 2022 05:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 286551121314;
	Wed,  8 Jun 2022 05:51:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B19291947B9B;
	Wed,  8 Jun 2022 05:51:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B6497194706E for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 17:17:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 941BFC27E97; Mon,  6 Jun 2022 17:17:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 903E2C27E92
 for <linux-cachefs@redhat.com>; Mon,  6 Jun 2022 17:17:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 794EC3979681
 for <linux-cachefs@redhat.com>; Mon,  6 Jun 2022 17:17:57 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-gd3cJ9CbNw6IQVfabNRjjw-1; Mon, 06 Jun 2022 13:17:53 -0400
X-MC-Unique: gd3cJ9CbNw6IQVfabNRjjw-1
Received: by mail-il1-f169.google.com with SMTP id f12so12412218ilj.1;
 Mon, 06 Jun 2022 10:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HOgnxEn2ntmtyghL8kOb8yKeTcYGElnyCDEZZ25iRQw=;
 b=u2Ah4ztDKD5CXEb1gkzwLPg+O95j2x6eJoL+Gh5jX6lISgQDaSfa/hX59u6+rcXI4n
 bz99zuGAD6dedH3NmuG53l7o8euOJQyjXaX1lU3VMJ7TIq+9Rxpfj4x68GbrTPq7x/fM
 PfcFKEihlfjhKPoDLbs44BSrOmJYeCIl+VWgArQRtoRZ8/4WS44rBDBghelpu5qTvFSL
 HGN0gr4jId4XF0LqL9l5aN6vUzG7TfnA3BoeFNwfW9rKYhxS+SdJA1Xmc5wK7xFEjpDm
 42Txn30vOsGPEkMXeVLEqhcZmRafer9rlXhOQrOvhbhy/5CFCxMgL6x5Y12zzYPkLNQo
 3eNw==
X-Gm-Message-State: AOAM533kRWCH11FZawwfUGiRtRX8JJmMfCM+JVjG+Ubk5iGhfl7Khb8E
 10Q9EC7YLYnMk+cML8bvzA==
X-Google-Smtp-Source: ABdhPJxXRz8rpxHVMQETrBoM9cb8XJJozkw5PJACTm4qK/vhBn8tviwY3PyY58j2eoaPB/u3qpK33w==
X-Received: by 2002:a05:6e02:184f:b0:2d3:d0c2:d56a with SMTP id
 b15-20020a056e02184f00b002d3d0c2d56amr13953839ilv.174.1654535872910; 
 Mon, 06 Jun 2022 10:17:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a92c0d1000000b002d3da8e4af5sm6121750ilf.23.2022.06.06.10.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 10:17:52 -0700 (PDT)
Received: (nullmailer pid 911134 invoked by uid 1000);
 Mon, 06 Jun 2022 17:17:47 -0000
Date: Mon, 6 Jun 2022 12:17:47 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <20220606171747.GB899329-robh@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1654529011.git.mchehab@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Wed, 08 Jun 2022 05:51:48 +0000
Subject: Re: [Linux-cachefs] [PATCH 00/23] Update Documentation/
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, alsa-devel@alsa-project.org,
 keyrings@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Markus Mayer <mmayer@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-cachefs@redhat.com,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 06, 2022 at 04:25:22PM +0100, Mauro Carvalho Chehab wrote:
> Hi John,
> 
> There were a number of DT binding conversions and other docs change that
> were not updated. Address them, in order to keep the cross-references on
> a sane state.
> 
> Patch series is against v5.19-rc1 (and applies cleanly on the top of
> today's -next).
> 
> Mauro Carvalho Chehab (23):
>   dt-bindings: mfd: bd9571mwv: update rohm,bd9571mwv.yaml reference
>   dt-bindings: interrupt-controller: update brcm,l2-intc.yaml reference
>   dt-bindings: arm: update vexpress-config.yaml references
>   dt-bindings: reset: update st,stih407-powerdown.yaml references
>   dt-bindings: mfd: rk808: update rockchip,rk808.yaml reference
>   dt-bindings: mmc: exynos-dw-mshc: update samsung,pinctrl.yaml
>     reference
>   docs: netdev: update maintainer-netdev.rst reference
>   docs: filesystems: update netfs-api.rst reference
>   Documentation: update watch_queue.rst references
>   Documentation: KVM: update s390-pv.rst reference
>   Documentation: KVM: update amd-memory-encryption.rst references
>   Documentation: KVM: update msr.rst reference
>   Documentation: KVM: update s390-diag.rst reference
>   MAINTAINERS: update arm,hdlcd.yaml reference
>   MAINTAINERS: update arm,komeda.yaml reference
>   MAINTAINERS: update arm,malidp.yaml reference
>   MAINTAINERS: update cortina,gemini-ethernet.yaml reference
>   MAINTAINERS: update dongwoon,dw9807-vcm.yaml reference
>   MAINTAINERS: update maxim,max77693.yaml reference
>   MAINTAINERS: update snps,axs10x-reset.yaml reference
>   objtool: update objtool.txt references
>   ASoC: wm8731: update wlf,wm8731.yaml reference
>   arch: m68k: q40: README: drop references to IDE driver

Applied patches 1-5,17,18,20

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

