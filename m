Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 575057117B2
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 May 2023 21:52:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685044359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2AaGHemxuDq11lm48UB2+Jmj9CX0FV8/C/OKiuSCvpo=;
	b=dEncjWoU2vXRm1KZVw7rLycbkgvjN2TgnsbOfz9bPugnbYHkHILuPiQb9lM1QRKqn43uQe
	g8XVPNUIlI9/hjc3GeOXRWJv6A77RD8rCUzEf1zCr9E7/JQCpL11Tc5um7AAxv/0VemjVq
	8GZA8YkQLdNVQX5WtcPAGl2EMOJErgQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-jg_4KCtnPgeAhRojCB9Kug-1; Thu, 25 May 2023 15:52:36 -0400
X-MC-Unique: jg_4KCtnPgeAhRojCB9Kug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F89B381D4CE;
	Thu, 25 May 2023 19:52:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6B2C2166B2B;
	Thu, 25 May 2023 19:52:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 59A1F19465B1;
	Thu, 25 May 2023 19:52:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A9C619465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 May 2023 19:52:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD1CF401024; Thu, 25 May 2023 19:52:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A540D492B00
 for <linux-cachefs@redhat.com>; Thu, 25 May 2023 19:52:26 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8976785A5AA
 for <linux-cachefs@redhat.com>; Thu, 25 May 2023 19:52:26 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-8z-04UKQNG2PvNzw_YxPPA-1; Thu, 25 May 2023 15:52:25 -0400
X-MC-Unique: 8z-04UKQNG2PvNzw_YxPPA-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1ae3f6df2bfso12430995ad.1
 for <linux-cachefs@redhat.com>; Thu, 25 May 2023 12:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685044344; x=1687636344;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VvyF8Ot82m7pwhH38R4SuJBTwtUK0H4nkf2njsfIhNk=;
 b=Nrf1GjzKAqkaJBPDM9FU8UqXRRLqx+csbPyTJapCf+SzaHm7ilYKeKSUrIFvwZqd3r
 uGwuey0WP7LckagjkdN5geueJMacVTDcZIk2maH2W7R7/5pCCTUwye3lgXPWpQVxoi5M
 ghtNzGFbwLBTY5Q7+t91VQXGzF3KcIN8skATGeK3OqHoOCKn9U/TvdbVjnnIx5pyiKls
 I+BX0yzP+LDdBI6j25a66Z/iCadvjwoqH6MvSKBjVVQUkL/lEJ5Q5W65vHW9AAMLxQ2+
 BmQlbYwj4XZ3W39uHGi0jvXHSwdFbZx0pGEoo3By4AsTgdHi+c0ON/lapYBws+0Sih6s
 T7KQ==
X-Gm-Message-State: AC+VfDwn0Q2ZDaoT++gLCLKOot8Hxx+666ti53Zhr2KreC6TBdb8rmRG
 cAB75i/36S+I1lW9ERA11lTJWufEISkVIjkg4cN40k3aZgHfaqDiUWONLaHvPKz/nQbrzPPU501
 5BxWpk5rcMFGFOeMMfqBER4n3aRVNeel3DVSFew==
X-Received: by 2002:a17:902:db0a:b0:1ab:1624:38cf with SMTP id
 m10-20020a170902db0a00b001ab162438cfmr3231908plx.60.1685044343899; 
 Thu, 25 May 2023 12:52:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XEiG9m/Z+HwGquzOg/fBTDY9azOD4VwXbDmtlmjsiWd1dZfkNSpGL7YhUvhGhjNywVvLJOdzsyyLb2OSRb4w=
X-Received: by 2002:a17:902:db0a:b0:1ab:1624:38cf with SMTP id
 m10-20020a170902db0a00b001ab162438cfmr3231892plx.60.1685044343655; Thu, 25
 May 2023 12:52:23 -0700 (PDT)
MIME-Version: 1.0
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 25 May 2023 15:51:47 -0400
Message-ID: <CALF+zOk_6oW5BYswnAyBrHaYj-r4Hgp3rV7HSZ8CyiH5BGdpDg@mail.gmail.com>
To: Daire Byrne <daire.byrne@gmail.com>, Daire Byrne <daire@dneg.com>, 
 Benjamin Maynard <benmaynard@google.com>, Chris Chilvers <chilversc@gmail.com>,
 Brennan Doyle <brennandoyle@google.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] 6.4-rc3 plus dhowell's 2 V6 optimisation patches,
 plus the NFS hunk (separate commit) pushed to github
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
Cc: linux-cachefs <linux-cachefs@redhat.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

In case there was some confusion on what I've been testing and passes
all my NFS fscache tests, I rebuilt on 6.4-rc3, added these patches
and pushed to:
https://github.com/DaveWysochanskiRH/kernel/commits/v6.4-rc3-dhowells-optimisation

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

