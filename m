Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066B566F44
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 15:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657028027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=e2dlxu4VuOKHc6mOWs0bbTyeB23ZRTVVI6oaV65f+haMscXZBnE88N98hOQWqepFh3J67Y
	vppbXl0F0xFb5mQbEuWg2o4ZQQpOcbw4c69WwdgiZ9nlILgeOGDmFoUkMCuf/jkQ1MzIp8
	ez2npNMsPsvF1rSyL0rxVTtum2XzkGs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-07sx9tdaPnOwFYTPAC8MGg-1; Tue, 05 Jul 2022 09:33:46 -0400
X-MC-Unique: 07sx9tdaPnOwFYTPAC8MGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E661294EDC8;
	Tue,  5 Jul 2022 13:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92EFD492CA3;
	Tue,  5 Jul 2022 13:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36413194705B;
	Tue,  5 Jul 2022 13:33:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E83B1947056 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 09:18:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1CB07415F5E; Wed, 29 Jun 2022 09:18:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 186E740F06D
 for <linux-cachefs@redhat.com>; Wed, 29 Jun 2022 09:18:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 009EB185A79C
 for <linux-cachefs@redhat.com>; Wed, 29 Jun 2022 09:18:19 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-ogepDrFXNuyzgXjHSy52DA-1; Wed, 29 Jun 2022 05:18:17 -0400
X-MC-Unique: ogepDrFXNuyzgXjHSy52DA-1
Received: by mail-il1-f200.google.com with SMTP id
 f18-20020a056e020c7200b002d949d97ed9so8648207ilj.7
 for <linux-cachefs@redhat.com>; Wed, 29 Jun 2022 02:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=IlDv6vBt+gIESrqay3H8zkwIopufdLUiAGQw8Clp/kybafta6FLm1GD3nqk0bOoXvX
 9ngZ/xw+tAjs5DOcJasrSa+RDYMRvtBZWwCSrOi9zuh0bRsxOrU3Oe+WzwKqJf4yjnVY
 IUqWL0AaK0TW6PW9m/bOHxn97NznGbdcFgdYXF718stkQgVE4T7knyYCcWk9HbPAq/5z
 WgC9OjoRGJevqCuF8dY55HLdvylGC2e4cKa/t2IlR5PFjV2SKq3tbdcOo7JZIaKh6JqI
 ALItleJvO0aWV7wBvKeaKa0dZnLp03TXyLBnhOJNLXP7w1sH67RwmOdjpQh72kY+lcip
 Wg1A==
X-Gm-Message-State: AJIora81ezp1+mUr5nYOV9RkhF6m/NeC4NGwMn31VSM7fJE61ui3zX11
 Mr1Pmd2ucBUWpiSaedi0Sgh7fwAq/9PC/xRheZu90bANT0rf
X-Google-Smtp-Source: AGRyM1s6t+4IF+v7hbqi2PlMOZGH0tixMsiyQiUO7bNWMmDuM04SIpLSXFwFyeW9YoDZuVAqPmhDBkViVN49Qz++gBK/VKkn0WTb
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2183:b0:2d9:5c41:52dd with SMTP id
 j3-20020a056e02218300b002d95c4152ddmr1410606ila.140.1656494296687; Wed, 29
 Jun 2022 02:18:16 -0700 (PDT)
Date: Wed, 29 Jun 2022 02:18:16 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000206fbb05e292a244@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Tue, 05 Jul 2022 13:33:42 +0000
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
 fscache_free_cookie
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This bug is marked as fixed by commit:
fscache: fix GPF in fscache_free_cookie
But I can't find it in any tested tree for more than 90 days.
Is it a correct commit? Please update it by replying:
#syz fix: exact-commit-title
Until then the bug is still considered open and
new crashes with the same signature are ignored.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

