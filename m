Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A172450F
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Jun 2023 15:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686059968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lLJ33wnEc2f5mgOBGNn6M4tPHnPjcfAduRTRKe33cJU=;
	b=Jt83FcMSePPWFDc26c6Nn4GFwn04pO9J0HEmgDbtlybDgrW5wCzo9OJnYh1eE+YoBMeDHa
	Ip11uJJ22plGngRktdV+sAmj8lun9qVS1SqlGG/ond8hL4cUs8bhmbEh6IMr6DggOVf0FB
	QL7W9LbYQH7Vj+xrdt+5oiuGpfHh22c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-rkbjNe4OOkS74GSyGAwdIw-1; Tue, 06 Jun 2023 09:59:25 -0400
X-MC-Unique: rkbjNe4OOkS74GSyGAwdIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58624101A53B;
	Tue,  6 Jun 2023 13:59:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E925140E954;
	Tue,  6 Jun 2023 13:59:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E79441946A44;
	Tue,  6 Jun 2023 13:59:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B9D31946595 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 May 2023 15:22:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1F0E2166B26; Wed, 31 May 2023 15:22:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9975B2166B25
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 15:22:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CCBC185A78E
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 15:22:21 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch
 [84.16.66.168]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-jlG2J1uSPvmx1zyMagjbXA-1; Wed, 31 May 2023 11:22:16 -0400
X-MC-Unique: jlG2J1uSPvmx1zyMagjbXA-1
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QWY0Q2wK1zMqBkH;
 Wed, 31 May 2023 17:22:14 +0200 (CEST)
Received: from unknown by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QWY0G4Z6QzMqFfF; Wed, 31 May 2023 17:22:06 +0200 (CEST)
Message-ID: <4b3fff12-f696-3d02-5873-645fef2117e1@digikod.net>
Date: Wed, 31 May 2023 17:22:05 +0200
MIME-Version: 1.0
User-Agent: 
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20230530142826.GA9376@lst.de>
X-Infomaniak-Routing: alpha
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 06 Jun 2023 13:59:23 +0000
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
 linux-unionfs@vger.kernel.org, linux-cifs@vger.kernel.org, paul@paul-moore.com,
 miklos@szeredi.hu, mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 linux-fsdevel@vger.kernel.org, wangweiyang2@huawei.com,
 viro@zeniv.linux.org.uk, dchinner@redhat.com, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, casey@schaufler-ca.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: digikod.net
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 30/05/2023 16:28, Christoph Hellwig wrote:
> On Tue, May 30, 2023 at 03:58:35PM +0200, Christian Brauner wrote:
>> The main concern which was expressed on other patchsets before is that
>> modifying inode operations to take struct path is not the way to go.
>> Passing struct path into individual filesystems is a clear layering
>> violation for most inode operations, sometimes downright not feasible,
>> and in general exposing struct vfsmount to filesystems is a hard no. At
>> least as far as I'm concerned.
> 
> Agreed.  Passing struct path into random places is not how the VFS works.

I understand, it makes sense for the FS layer to not get access to 
things not required. IIUC, the main issue is the layering, with LSM 
calls being sometime at the last layer.


> 
>> So the best way to achieve the landlock goal might be to add new hooks
> 
> What is "the landlock goal", and why does it matter?

Landlock's goal is to enable (unprivileged) users to set their own 
access rights for their (ephemeral) processes (on top of the existing 
access-controls of course) i.e., to sandbox applications. Landlock rules 
are defined by users, and then according to the FS topology they see. 
This means that Landlock relies on inodes and mount points to define and 
enforce a policy.


> 
>> or not. And we keep adding new LSMs without deprecating older ones (A
>> problem we also face in the fs layer.) and then they sit around but
>> still need to be taken into account when doing changes.
> 
> Yes, I'm really worried about th amount of LSMs we have, and the weird
> things they do.

About Landlock, it's a new LSM that fit an actual need. I'd be glad to 
hear about not recommended things and how to improve the situation. I 
don't know all the history between VFS and LSM.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

