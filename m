Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5309B63FCD0
	for <lists+linux-cachefs@lfdr.de>; Fri,  2 Dec 2022 01:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669940501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=MkXbR+ATt5ZyHsLgyyYBfndo5DOmXvnTOk39ZhbQCBEtbHEUDTD+TQFb6f6MTKUaFPEHmH
	2+wwDEdAoH9X+/RkiOQjv4vz+wR9JjKibhjBbfOgHUeU7dslmkQqsxnamJ41qPh0voQisL
	YJWKH0tvEy2pg5taKOMC9JI7asFCxr0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-FBQx7x3DMRKKq4_jwb17Ng-1; Thu, 01 Dec 2022 19:21:40 -0500
X-MC-Unique: FBQx7x3DMRKKq4_jwb17Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10D8E811E7A;
	Fri,  2 Dec 2022 00:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 370E8C15BB4;
	Fri,  2 Dec 2022 00:21:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C636B19465B2;
	Fri,  2 Dec 2022 00:21:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E8BE519465A0 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  1 Dec 2022 07:39:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C5EF5C15BB4; Thu,  1 Dec 2022 07:39:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF15EC15BA5
 for <linux-cachefs@redhat.com>; Thu,  1 Dec 2022 07:39:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A50CD833AEC
 for <linux-cachefs@redhat.com>; Thu,  1 Dec 2022 07:39:31 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-XbKTG6EiM06RZu9weky7cw-1; Thu, 01 Dec 2022 02:39:29 -0500
X-MC-Unique: XbKTG6EiM06RZu9weky7cw-1
Received: by mail-il1-f199.google.com with SMTP id
 d2-20020a056e020be200b00300ecc7e0d4so1220510ilu.5
 for <linux-cachefs@redhat.com>; Wed, 30 Nov 2022 23:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=Aixm1GgcoCcHCU50/XPnrYwdAnQRB6NvjFUAdXvf88VS6XMQDNnVuWBUZeDPcYQyLG
 hqcauqZZGhX0mXyvpA1zNLuVebepWHo5dVxAdRDKufTLmwflXtR00gfrMFPlZI8EO6Sz
 9SLz4wRt40XXNILKGkCd5WcwTXpEB8KwUyRVWGK3b88BejspLlLECLODSjF82wtP25u0
 ibEpXo2+qLRsSNuZPjionFhfO3QUeoqXXAav8kSORulW5XbIgCpJYlX7xK94G4/g3eBo
 S+Sx1conB74jTafyhKOh4ABwsymC2Vp+O4Fz7SH3zTTpjU/iFnC63tbxUZ0FATCKXC1w
 o1lg==
X-Gm-Message-State: ANoB5pk3ZN+j7vFW1rftQJrGMT1baTm0CfKMYybEgoUfjnDv7Ce76gmF
 4xAjJLC7HxG/fNcXiiCZWbO7scBklGq1WNKwULjUNc6DUFio
X-Google-Smtp-Source: AA0mqf6TEaExiCBLiN5lVFzq28y5UfbzPncz6y1OGUlTmIHBsnAh0zShpCzvPqMreHnr3BXx3Z1gWLA7DwNgRAc2gYCUA/2hoiy3
MIME-Version: 1.0
X-Received: by 2002:a92:da48:0:b0:302:ebf5:a7ae with SMTP id
 p8-20020a92da48000000b00302ebf5a7aemr17788055ilq.34.1669880369263; Wed, 30
 Nov 2022 23:39:29 -0800 (PST)
Date: Wed, 30 Nov 2022 23:39:29 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a3d8905eebf52af@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, dvyukov@google.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, nogikh@google.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Fri, 02 Dec 2022 00:21:28 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

