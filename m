Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84D566F45
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 15:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657028034;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=04cxUBQQ5p4aculkoWNwMGz8j2Euv8VC4uplqsgcUtw=;
	b=MwqiA0XqJudJSIcmWMqgF9iEGDkfk1qvWvKMzf8UpYNvwPsyeUr7Fq7wOYYT34FRmGT99+
	sXpz5SgUsBjjbFbVZ1IleQCRzx7saj71srhkiu82wAi9L9vRqjiupyTYkME7md+aHVj7JI
	lLCdTVqPlYzcVupFaheA76MQ8YCEvrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232--I5gWRCDPdGT3Jov1M_vWQ-1; Tue, 05 Jul 2022 09:33:45 -0400
X-MC-Unique: -I5gWRCDPdGT3Jov1M_vWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DDA818A6531;
	Tue,  5 Jul 2022 13:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9341D2166B29;
	Tue,  5 Jul 2022 13:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EF6E1947057;
	Tue,  5 Jul 2022 13:33:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99D7C19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 03:25:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8293FC26E98; Wed, 29 Jun 2022 03:25:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E712C08087
 for <linux-cachefs@redhat.com>; Wed, 29 Jun 2022 03:25:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65784185A7A4
 for <linux-cachefs@redhat.com>; Wed, 29 Jun 2022 03:25:55 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389--FYXIHMyN8ufq5ShZ2hByw-1; Tue, 28 Jun 2022 23:24:06 -0400
X-MC-Unique: -FYXIHMyN8ufq5ShZ2hByw-1
Received: by mail-pj1-f41.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so17943181pjl.5; 
 Tue, 28 Jun 2022 20:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fj7BbdljqsoGparCST0EyCcPUKNtLNBlk+LCRCpdJLw=;
 b=LMP+QHQH5VP869ygck9dEzb5KVF3toFHJtcCnxWcydwQ2czGIlHLqPcPOIZ64SgExS
 VPNCYMPtl4Wt0RsmSkxCnf8QqOpQJdKndumkuBP2B9Kct1RK46j7ckAL+BhO9bK2zaL5
 JqbMQe3W7PjmxhEqORY7vEvZbQxg40Ax5nYoTwp/Civ78RUDl9dVSCGAT5MyeLW4v9Nf
 253hXO4ceR87kTZVBABznxEHOMzugLl1vMsTRTun6S95yoEyzz/DiIMrAcyJAuvxQl+Q
 Ze8qdP2oQBBndeWt/8YwplO/ebf0s+V0RB8Oh+FitBjZejpfDi02Q+0SCMPGfsYxmnhD
 0Xgg==
X-Gm-Message-State: AJIora93MdXZxgwYCaqPxme8mY1w742IEI9hyYeKSufnJbf9bsaI2Oju
 5J0OwvJJEIKrsHcsXrpeePc=
X-Google-Smtp-Source: AGRyM1vsi7CgNn+hm6JA8nRBvn1UfsHiN+DuVQjG+D41n++oNdHScStsgrICm72S8/mDUKvSMDDq4A==
X-Received: by 2002:a17:902:a701:b0:16a:65b:f9f1 with SMTP id
 w1-20020a170902a70100b0016a065bf9f1mr8387462plq.73.1656473045455; 
 Tue, 28 Jun 2022 20:24:05 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-13.three.co.id. [180.214.232.13])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709026b8900b0016372486febsm10011584plk.297.2022.06.28.20.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:24:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E4C29103832; Wed, 29 Jun 2022 10:23:59 +0700 (WIB)
Date: Wed, 29 Jun 2022 10:23:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <YrvFzoH61feRFoxV@debian.me>
References: <cover.1656409369.git.mchehab@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1656409369.git.mchehab@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Tue, 05 Jul 2022 13:33:42 +0000
Subject: Re: [Linux-cachefs] [PATCH 00/22] Fix kernel-doc warnings at
 linux-next
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-cachefs@redhat.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Alexander Potapenko <glider@google.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kasan-dev@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Marco Elver <elver@google.com>,
 linux-pm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 Johannes Berg <johannes@sipsolutions.net>, Dmitry Vyukov <dvyukov@google.com>,
 linux-sgx@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 28, 2022 at 10:46:04AM +0100, Mauro Carvalho Chehab wrote:
> As we're currently discussing about making kernel-doc issues fatal when
> CONFIG_WERROR is enable, let's fix all 60 kernel-doc warnings 
> inside linux-next:
> 

To be fair, besides triggering error on kernel-doc warnings, Sphinx
warnings should also be errors on CONFIG_WERROR.

-- 
An old man doll... just what I always wanted! - Clara

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

