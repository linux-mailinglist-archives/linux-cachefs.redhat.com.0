Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1249716452
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 May 2023 16:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685457429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YWWUCYd3vlrLQ1gkfK5o1o3ckjrQmWe67Oe6Ssd/dJY=;
	b=GQ7cP9MoDEcItiyrUM0i4RXFS6vgSORNsxVjCGKgFck1QY2KGDf6CHbElgB0GdLqVqy8Tu
	91ZzVFHDiOkdF3hwOh2kG6+8q9Hw0pYzlKiZ0hrXRZshBOgm9+lugH54YcXgi95VXNkD5g
	ReknIRWik8D2Nks8yG9Gw1Fci6HHtbo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-e5S3mq1SNGqPOnFV32ybiA-1; Tue, 30 May 2023 10:37:06 -0400
X-MC-Unique: e5S3mq1SNGqPOnFV32ybiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4E693C11A14;
	Tue, 30 May 2023 14:37:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B814C2166B25;
	Tue, 30 May 2023 14:37:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B98319465A8;
	Tue, 30 May 2023 14:37:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 541E11946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 14:37:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36A5B112132D; Tue, 30 May 2023 14:37:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F35E112132C
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 14:37:04 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13124185A7A9
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 14:37:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-WA4y8RveOiyc5H8II2BiKg-1; Tue, 30 May 2023 10:37:01 -0400
X-MC-Unique: WA4y8RveOiyc5H8II2BiKg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 277B268B05; Tue, 30 May 2023 16:28:27 +0200 (CEST)
Date: Tue, 30 May 2023 16:28:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230530142826.GA9376@lst.de>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
MIME-Version: 1.0
In-Reply-To: <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-cifs@vger.kernel.org, paul@paul-moore.com, miklos@szeredi.hu,
 mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 linux-fsdevel@vger.kernel.org, wangweiyang2@huawei.com,
 viro@zeniv.linux.org.uk, dchinner@redhat.com,
 =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, casey@schaufler-ca.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 03:58:35PM +0200, Christian Brauner wrote:
> The main concern which was expressed on other patchsets before is that
> modifying inode operations to take struct path is not the way to go.
> Passing struct path into individual filesystems is a clear layering
> violation for most inode operations, sometimes downright not feasible,
> and in general exposing struct vfsmount to filesystems is a hard no. At
> least as far as I'm concerned.

Agreed.  Passing struct path into random places is not how the VFS works.

> So the best way to achieve the landlock goal might be to add new hooks

What is "the landlock goal", and why does it matter?

> or not. And we keep adding new LSMs without deprecating older ones (A
> problem we also face in the fs layer.) and then they sit around but
> still need to be taken into account when doing changes.

Yes, I'm really worried about th amount of LSMs we have, and the weird
things they do.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

