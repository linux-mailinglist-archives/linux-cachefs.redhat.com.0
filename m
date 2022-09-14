Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7075EF077
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Sep 2022 10:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664440181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=cH5YQqfG6HxaEi+CRpddwqjHGs4M2HNVC6V52R8pUYw5b0+aMjXAwAQQC2lIIuG2E4B/ZM
	Kd7wdNT1+KwOfe2Xvi02ZAqBKCGg68u4mSEOoB/OVRYQ+fdpw4oV9BSWCUp7XZmAhusr2z
	DuHK2oG3sMMa8yTzdcxq6gE35vtRzE8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-J-HnJQB3PK2VP5RQkRhF5w-1; Thu, 29 Sep 2022 04:29:37 -0400
X-MC-Unique: J-HnJQB3PK2VP5RQkRhF5w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39D083817A6F;
	Thu, 29 Sep 2022 08:29:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30789492B04;
	Thu, 29 Sep 2022 08:29:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6E8D1946A48;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED1211946A4A for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 14 Sep 2022 09:14:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEA0FC15BA5; Wed, 14 Sep 2022 09:14:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2DEC15BA4
 for <linux-cachefs@redhat.com>; Wed, 14 Sep 2022 09:14:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2CD68027FD
 for <linux-cachefs@redhat.com>; Wed, 14 Sep 2022 09:14:32 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-3ccISQuIMFqjowuQzJ6lzQ-1; Wed, 14 Sep 2022 05:14:30 -0400
X-MC-Unique: 3ccISQuIMFqjowuQzJ6lzQ-1
Received: by mail-il1-f197.google.com with SMTP id
 c7-20020a056e020bc700b002e59be6ce85so9921047ilu.12
 for <linux-cachefs@redhat.com>; Wed, 14 Sep 2022 02:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=m0UEIps12QPLqspbFD79nr7jIggnFccpN0/ZbUi/0EsbT0GSW46+toANMD2EmL+XLg
 RGTXVFIM/uC6GGoCAwySBqYQWEVUeA9EAIOLJmNvSWiQvfKpALoP1x0hOu5ZCF3c4jJ7
 nYJt4dO/wMLogu61xudLcakqscZ/DiCjhMU9n6nptfMHXl6HpW9wjZ+fV7Ca0ATHEon4
 jrPqPA6wbrmqFuYiDM8PW/5JZoKFo10HGqkDjbxuwoFU0OwJFDo2SHAzrOFRLpeT0cRP
 Itjkclht3/+6sNc92RD/GVOeEPILEl+azhqRjCbTuW7yeL6Vzmic2vawWITxAOK9zIBg
 JA6g==
X-Gm-Message-State: ACgBeo1TRfiVlmHyHHzu1mFYctXleMy4jqYj9EsGR3VwSCmiUBdLmRZN
 bWY1e43VuSLMVovOYpA9gY7No6b4oGUewaCWEkPWfUNthScN
X-Google-Smtp-Source: AA6agR4BRQZ9v+xAqQp9fF6gEOPwNPIxhbDfhFuSJ+t1B0A4HFpARmOh7n2fRvoiVl6/uF1rCG2iIIjphcYUjUZenyskQCJdBIZq
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4710:b0:35a:6372:3df0 with SMTP id
 cs16-20020a056638471000b0035a63723df0mr2213610jab.277.1663146870026; Wed, 14
 Sep 2022 02:14:30 -0700 (PDT)
Date: Wed, 14 Sep 2022 02:14:30 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000065b65e05e89f8e72@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
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
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:29:35 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

