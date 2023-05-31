Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E161718218
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 May 2023 15:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685540391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hJPz7CR8FYjICQaWPI0E+iyswHr6xyJgDWingLAEQuY=;
	b=JXeg3yvBcdTHSbyW2y7S6AIdJ2V9M/bso7YD/dOZahXluo9AE0TwXHexiTi4Y6V6NVTqrc
	Kyv1SeNSIQ5kWm7TZ2Kx/fB1wBikuO7y/qRZqgXn7m+UbHI/rjgbw7eC98gDr3AajuXlTn
	1M8hgnb6urpf++Z4jknRzIFVxyqH+7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-EjkXlLz8OtSolvtBLvYbqg-1; Wed, 31 May 2023 09:39:50 -0400
X-MC-Unique: EjkXlLz8OtSolvtBLvYbqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61FA580120A;
	Wed, 31 May 2023 13:39:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0165C492B0A;
	Wed, 31 May 2023 13:39:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CD1919465A8;
	Wed, 31 May 2023 13:39:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49F6D1946595 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 May 2023 13:22:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38AFE200AD6E; Wed, 31 May 2023 13:22:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31590202696C
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 13:22:07 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15DC01C041A6
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 13:22:07 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-17_FnvPMNwSHdJzzE8ZZBQ-1; Wed, 31 May 2023 09:22:05 -0400
X-MC-Unique: 17_FnvPMNwSHdJzzE8ZZBQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4814868B05; Wed, 31 May 2023 15:22:00 +0200 (CEST)
Date: Wed, 31 May 2023 15:22:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <20230531132200.GB30016@lst.de>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
 <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 tom@talpey.com, wangweiyang2@huawei.com, viro@zeniv.linux.org.uk,
 dchinner@redhat.com, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
 eparis@parisplace.org, hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com,
 Christian Brauner <brauner@kernel.org>, john.johansen@canonical.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 07:55:17AM -0700, Casey Schaufler wrote:
> Which LSM(s) do you think ought to be deprecated?

I have no idea.  But what I want is less weirdo things messing with
VFS semantics.

>
> I only see one that I
> might consider a candidate. As for weird behavior, that's what LSMs are
> for, and the really weird ones proposed (e.g. pathname character set limitations)
> (and excepting for BPF, of course) haven't gotten far.

They haven't gotten far for a reason usually.  Trying to sneak things in
through the back door is exactly what is the problem with LSMs.

> 
---end quoted text---

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

