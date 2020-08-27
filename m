Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCFF25460F
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Aug 2020 15:38:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-So7QAQ5iNlmERWcldaQhQA-1; Thu, 27 Aug 2020 09:38:24 -0400
X-MC-Unique: So7QAQ5iNlmERWcldaQhQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 951BC1054F99;
	Thu, 27 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 852F16198B;
	Thu, 27 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C9A818408AC;
	Thu, 27 Aug 2020 13:38:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07R1BDi5016211 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 21:11:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 862471006515; Thu, 27 Aug 2020 01:11:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81F971006507
	for <linux-cachefs@redhat.com>; Thu, 27 Aug 2020 01:11:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B3978EE648
	for <linux-cachefs@redhat.com>; Thu, 27 Aug 2020 01:11:11 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-215-jZjAnDP2PdK15mhyHvvoig-1; Wed, 26 Aug 2020 21:11:09 -0400
X-MC-Unique: jZjAnDP2PdK15mhyHvvoig-1
Received: by mail-io1-f70.google.com with SMTP id k133so1400293iof.16
	for <linux-cachefs@redhat.com>; Wed, 26 Aug 2020 18:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=NYrrGTRexboki2HLW6RsbGRdLIlrj7zalnOfN9qVvpI=;
	b=SiyM3cVBtToqpf/u9i74Yohy2/eBZ54mNvX7PU5jdEWyg6EKCOspr0rjYRzt+r563g
	LgMlhmNVFM0+xmQl1b06xKvyu8uvZ0uRfJTy0L4KI438xs5Lwfw4Bkcyj8Ouo9bhkS3N
	WaFHdI1Uh5xd7cISaAs3BAbW7b00EsdsidEYspZFPULRfslqbQIK35FpUwgwpMtMNyJv
	IN/BzMiKv9qqD6Bf391UkUKJF3x1u/KABap0rc3E6BrbjEKWBWjcOIF80WsuxtI2EOQ9
	BDmkBqRy0nsj+80ldZ160Dnf1wjwYoqgM8gcoTbJ1P8abG7oHrdpDvm3t2pWpM+1eGjP
	pEYg==
X-Gm-Message-State: AOAM533ZBpU8J3aTIgTIsqKksAYH2ISK5zaKUgspzgkIlGjpo8ipMC7d
	ef53I6TQm3aYTgsJMvPyQ9VV5/Gga+nCMgsWoftWdkT1S/RK
X-Google-Smtp-Source: ABdhPJyWTAOtjNbMelzOqWh45HRoneg/M/Ww24g1T1cgnWVaOCUqZJImsQySP/GAtqRaI/vdPOxfZixG9gO6P73jsp0D/qaAudB7
MIME-Version: 1.0
X-Received: by 2002:a92:a119:: with SMTP id v25mr16044253ili.77.1598490668571; 
	Wed, 26 Aug 2020 18:11:08 -0700 (PDT)
Date: Wed, 26 Aug 2020 18:11:08 -0700
In-Reply-To: <0000000000004740cd05ac444126@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a21a405add19c0b@google.com>
From: syzbot <syzbot+f59c67285cb61166a0cf@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org,
	linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 27 Aug 2020 09:38:14 -0400
Subject: Re: [Linux-cachefs] KASAN: use-after-free Write in afs_manage_cell
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

syzbot has bisected this issue to:

commit c99c2171fc61476afac0dfb59fb2c447a01fb1e0
Author: David Howells <dhowells@redhat.com>
Date:   Thu Nov 1 23:07:27 2018 +0000

    afs: Use fs_context to pass parameters over automount

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10679fa9900000
start commit:   abb3438d Merge tag 'm68knommu-for-v5.9-rc3' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12679fa9900000
console output: https://syzkaller.appspot.com/x/log.txt?x=14679fa9900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=891ca5711a9f1650
dashboard link: https://syzkaller.appspot.com/bug?extid=f59c67285cb61166a0cf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d97d46900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14eb9fa9900000

Reported-by: syzbot+f59c67285cb61166a0cf@syzkaller.appspotmail.com
Fixes: c99c2171fc61 ("afs: Use fs_context to pass parameters over automount")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

