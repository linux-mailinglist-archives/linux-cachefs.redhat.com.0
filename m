Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE8C928AE61
	for <lists+linux-cachefs@lfdr.de>; Mon, 12 Oct 2020 08:50:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-bTAY_mhdPrWDuN43BcV7nw-1; Mon, 12 Oct 2020 02:50:24 -0400
X-MC-Unique: bTAY_mhdPrWDuN43BcV7nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A1FF1017DC2;
	Mon, 12 Oct 2020 06:50:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ACD67666B;
	Mon, 12 Oct 2020 06:50:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77FB492317;
	Mon, 12 Oct 2020 06:50:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09BCSBMa026787 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 11 Oct 2020 08:28:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0473A2017DCB; Sun, 11 Oct 2020 12:28:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2EF9206401F
	for <linux-cachefs@redhat.com>; Sun, 11 Oct 2020 12:28:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94AFE85828F
	for <linux-cachefs@redhat.com>; Sun, 11 Oct 2020 12:28:08 +0000 (UTC)
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
	[209.85.166.208]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-544-O5GbSggcONy8ydeg833ehg-1; Sun, 11 Oct 2020 08:28:06 -0400
X-MC-Unique: O5GbSggcONy8ydeg833ehg-1
Received: by mail-il1-f208.google.com with SMTP id e3so10500581ilq.18
	for <linux-cachefs@redhat.com>; Sun, 11 Oct 2020 05:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=EDB5NZGw8qQ43rEg6l7KdvPf4RNp1vg5LBmECT+lt9E=;
	b=M84lnpwVAMDh0wZ7HdBqaAQbXVGXpR5aLgwMlFizpqgeoSPEHFZ/WmpcKnrGuIHy2J
	0iaMd0g8a7cTABeOAxmz18v3u2iA0qcCzrFIQEnbwpOGeBoKkijdxmYznVA3h0Q1y7y2
	6TgFukphSrSY1pzoss4UknChVOBfCmGDr0CgBr4sZV31eic1bbfqD+/slmjgqEJhCRm2
	1+4mYvH8B6oOKAuRjKI2dnI5X6AMot5DEmvQQvIl79ZnvIEExUHjjUO/wfDzbTtLaKWm
	b4jw6wYX6CUli+U6daHQMkkTZeLy+yBznTOWg/4o0XYSzcMSKHRjT9NzwCfDkniPS5kI
	+mRg==
X-Gm-Message-State: AOAM531ENOAwBW0Dau1CeMZc7Zzo/Echxcpo/5lvs7W8dLrEFXm8mqvc
	T9Iur2ZaMY7qMW6K4pv1nX0ffCQz+oSiQHkRhb4OxpU6Se47
X-Google-Smtp-Source: ABdhPJxKSG8HAsmoVPNeZb5m/PDhpBKzzO/MJ5ApKW3AfuxtHLoUiUgm7uB+jBFbva8PBG/P6NibIxqN5tm9YBayUTh7p2qHB5nn
MIME-Version: 1.0
X-Received: by 2002:a92:ba1c:: with SMTP id o28mr15291963ili.182.1602419285649;
	Sun, 11 Oct 2020 05:28:05 -0700 (PDT)
Date: Sun, 11 Oct 2020 05:28:05 -0700
In-Reply-To: <000000000000e32a8b05b01f808a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004d719705b164508d@google.com>
From: syzbot <syzbot+2d0585e5efcd43d113c2@syzkaller.appspotmail.com>
To: dhowells@redhat.com, hdanton@sina.com, linux-afs@lists.infradead.org,
	linux-cachefs-bounces@redhat.com, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	viro@zeniv.linux.org.uk
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 02:50:08 -0400
Subject: Re: [Linux-cachefs] KASAN: use-after-free Read in
	fscache_alloc_cookie
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

syzbot has bisected this issue to:

commit c99c2171fc61476afac0dfb59fb2c447a01fb1e0
Author: David Howells <dhowells@redhat.com>
Date:   Thu Nov 1 23:07:27 2018 +0000

    afs: Use fs_context to pass parameters over automount

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17960d58500000
start commit:   171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14560d58500000
console output: https://syzkaller.appspot.com/x/log.txt?x=10560d58500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f4c828c9e3cef97
dashboard link: https://syzkaller.appspot.com/bug?extid=2d0585e5efcd43d113c2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a33ad3900000

Reported-by: syzbot+2d0585e5efcd43d113c2@syzkaller.appspotmail.com
Fixes: c99c2171fc61 ("afs: Use fs_context to pass parameters over automount")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

