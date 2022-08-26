Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4065A1FF0
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 Aug 2022 06:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661488673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cOKdIsfqOHrHMiMI7kbmLLRq86sTYJQMuorP35kCq40=;
	b=emOj4/AbCBi6zLQMGGxdBiIzqi8P0AaegQMl85JzFRaj7tt2iTYfNqH+v5YtegLtuaWl0k
	BkLoNyP8qLWA9ZXYw7K7PbI+uqoP+4CxOjy96VJTkM8vTjql38/ELjrLPDzzGz9LKad7EE
	n9bqej9CxdkB8ztOyfpk2RUZ/7yhLFs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-CCbh5-e9N0S2dFe87JksbA-1; Fri, 26 Aug 2022 00:37:50 -0400
X-MC-Unique: CCbh5-e9N0S2dFe87JksbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CD183800C35;
	Fri, 26 Aug 2022 04:37:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9DA1410F38;
	Fri, 26 Aug 2022 04:37:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E13851946A52;
	Fri, 26 Aug 2022 04:37:48 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E1701946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 26 Aug 2022 04:37:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E591240B40C8; Fri, 26 Aug 2022 04:37:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E12BB40CF916
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 04:37:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5BFD101A54E
 for <linux-cachefs@redhat.com>; Fri, 26 Aug 2022 04:37:46 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-L3zp8OWkMNmyZVQy47gHXQ-1; Fri, 26 Aug 2022 00:37:44 -0400
X-MC-Unique: L3zp8OWkMNmyZVQy47gHXQ-1
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q4671e025354;
 Fri, 26 Aug 2022 04:37:31 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j4w240jbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 04:37:31 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27Q2ltxn009542; Fri, 26 Aug 2022 04:37:29 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n6ntt7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 04:37:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR1001MB2152.namprd10.prod.outlook.com
 (2603:10b6:910:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Fri, 26 Aug
 2022 04:37:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5546.025; Fri, 26 Aug 2022
 04:37:18 +0000
Date: Fri, 26 Aug 2022 07:37:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sun Ke <sunke32@huawei.com>
Message-ID: <20220826043706.GC2071@kadam>
References: <20220826023515.3437469-1-sunke32@huawei.com>
In-Reply-To: <20220826023515.3437469-1-sunke32@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MRXP264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::26) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e208203-7c90-4f08-4e48-08da871ca8a7
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: g2Gxz1Edep06EFKAp7hoergTii62rZ0zn5MWQhJQID3bUBppc59q+GHB87LFlKuANrLPkYnHgbqOvgy0vCv6EoEnruINuyNWR6SdOnVku4nXmJD3FZsbnbNjbkpLD/SQaU7iTpZUOfFEvAQxHUmRnC7b5Nof6HUZa7PdVbhu1rBB+Ndwy3hbLSgB2X8K9qaz3UmqSDuPLectKhxr/o63p76eMsq8biaiXLuyIAHFJKGmCsx60vlHa+XJmr1m1jbhtgm8Kid0UkyS8RYJSJ8wI1nb8XClh4/+guHRPW9FSpPobdIkrSmHzcsPzrckZpArYbdN/sibmPXe+PD7ob1/w22urwurOSKDJVoFZAJXF6bzb3wuSBIFxWwmtyKsSKdMgt2k/Bqbtsm7UyozHRM/azQVmj+//C5FImvPllAXkOLCflXSOFEBxovxMBf7MqfdjOtxwkCVj7Ls8xLey0HughCoDmNPuAa/43322LrPiynCKLPVDk8fU+HdMH5mkUN5Az/FSlQeMW/8XEQno3GJalEZHzpwIo7SR+Gk+Xtg1ornBgDndKEa5YpX9NpF/1Dk6R7UX6mIf3i29SWrHWnGejuhTxVy8AH1+7kMPUUimUGBLzI6+dJ5KctFyErQLCZlhDDe6vOqhXZ2Hhqs9aNSWacEhTRGl8tD66tDEe0+clgaOyoDdULsCGwuFHFbAx60y2wGLR/4l34glyack0sIMUBS8bvU1bYJgdWdZ8eMSXPozmPXYBYcgcy6CBbIMPCbWI9Y2/6d0KEchSksi4rVig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(83380400001)(33716001)(38100700002)(66556008)(38350700002)(66476007)(66946007)(8676002)(4326008)(5660300002)(9686003)(4744005)(44832011)(26005)(8936002)(6486002)(33656002)(316002)(6666004)(478600001)(6916009)(41300700001)(6512007)(186003)(6506007)(1076003)(86362001)(2906002)(52116002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMdJJOFV79TCNgqP3TOgYODfv9pgvnx2soFuGQ8bsPV6w2TeL1QVkmtmtN2I?=
 =?us-ascii?Q?eih8AM/gcUt+bsbi3WiTM1SGS+zM5bhudLSW/zFP2e7/YDzFGv0Nz2xhBXM2?=
 =?us-ascii?Q?LFI6R3lvWUN30rivVe159C553OlnyuHrbqUuSHNEHQxdKMN9w/jfmwVAiUXt?=
 =?us-ascii?Q?rs7owahbLICrvsx2sM6HeVPyuZg/Zo8sFHpxR5KjGj01PL5GftgL43nwBCe9?=
 =?us-ascii?Q?ufmJjPrEh4AmkUhm4GvIWVEE/GY14yKfHIEZkxhfu3142Y7HKxKjghBfDhgW?=
 =?us-ascii?Q?BmTFYagwgWJjHqIVVSVXC3awswBMjVcnk2PH9+hOoWzCFYlwFLk984J9Jk6O?=
 =?us-ascii?Q?LM9oG44aL85CV9SbgJIoP5KKnUOKJyi23KBLvs7wF2h6JrvPi4N9TICAMSeI?=
 =?us-ascii?Q?sOn1zOx048H4FuEOER9XBx0w39/xNmMiayQPBD1hqvcxxPWCOkExlQOUrg/b?=
 =?us-ascii?Q?WLjcsf8ajrm3zpiuEt4IJ48Su7nozKAsql3PZW8gp+sNBBlzuZx1MD779Lwf?=
 =?us-ascii?Q?bgxSsLMWUjhX3JqXFdBobJYjCildPhKPDJvCJ877giR9pLOcJ+kJHAXBRBjb?=
 =?us-ascii?Q?zPunEQL11L/i5yJnl0n3A1ewCViBeNfTbC20NKifMJkZhduKnSSdIuG3W97p?=
 =?us-ascii?Q?HBsBfES9BeUZucFUpNYEWCycMhQBhoVfOdDYw1h3EosdLOtaKkZWvpzmq1Vu?=
 =?us-ascii?Q?0CqLo3POTbwXCvxE71XrXHCkOHJSPS6OnTxXGHYwC1ZitzX9lQ578LcdJ7J5?=
 =?us-ascii?Q?BlTF+NMMjwp9XPeGfhfqgKUWWnG0yiLPhZOLe+K2SLlpZQu/h9oDVdel70aw?=
 =?us-ascii?Q?kTrSnZtDwSmYpbPy1RzQfBLsK0b26KkyBmTGvbyT7tO19XcDpFuUqk9PoHwU?=
 =?us-ascii?Q?6+IHZsJGZ72rMEEcOyg+/EMVdpcMUzPkPSwrIc8IvPEaYbubiRwOxfQgeAkD?=
 =?us-ascii?Q?dVmS2hgI3PwF7TqSoxQLelF7N6VV55W3M2b2Fg1mxldwzFaIFQHcSgEBgkOB?=
 =?us-ascii?Q?c2fxXc8uVSxnYKm93tSTvStozpRCN+hKaZo5GkBeOvH8fsAu/hDUddR6Uf6p?=
 =?us-ascii?Q?I81qvYL2YMyuA788uJKpf8zLNou4GZHxOo6CTXbfW8OdpaBwbkJXGbsiWXOd?=
 =?us-ascii?Q?8jzx4F3cVP/OoNNSeuufs+kzPcLeUwWy4f5gYV79zpqELbOg1U5NFhD45KX/?=
 =?us-ascii?Q?5mk147QpHrgz2yO4MpefZGv+bEkhlFjXIGuJwE/3SarMCDpVLO1fczQNKYMV?=
 =?us-ascii?Q?cbcFSt/84N7zTOz8OuwvS0+Yqroud2/QP7up5lDCeIe8R5w5Mb1AouGQgd9b?=
 =?us-ascii?Q?mfFRqMcjdCwUK4ee4uTdvs+dQDysVGrPgsIaXhV5o+R/kCLGjbIXEQPv8jDx?=
 =?us-ascii?Q?WJNNwBzEOaguNL4MbdtSvd6nVE3Arm1WX843Qua4pA7U1ddCofQdiqV0jJf1?=
 =?us-ascii?Q?63NSEwpFNKHUVMRAXWdILjlE2QNI9iE1BI/8cnMi7DGZja882b5DO+knZYgQ?=
 =?us-ascii?Q?ZZkZHAWgbjGb82ap3gdgmqnhYWyFKCfzZmhFgi+SxYhgjzXgEGU3evWsCLb+?=
 =?us-ascii?Q?oeOikKGaEWMPtmXfZutSp+FFVx9WCdMCxqKhQdqdZTG7k4f8hmfmefNzedX7?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e208203-7c90-4f08-4e48-08da871ca8a7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 04:37:18.6592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITkTYXR7K+7JumsdOL8ilC6WFX17eeSC/PrMKGsTlAYDp7Pj8fAtQc9TdrtnMvEDgWt6Q7EljMVKOkn57IrB5roLURPhWfRbe5lYpWAgP6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260016
X-Proofpoint-ORIG-GUID: oVsFl1BzbbFnzQ4VOottSCBbyrtiP6Lv
X-Proofpoint-GUID: oVsFl1BzbbFnzQ4VOottSCBbyrtiP6Lv
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v4] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 26, 2022 at 10:35:15AM +0800, Sun Ke wrote:
> The cache_size field of copen is specified by the user daemon.
> If cache_size < 0, then the OPEN request is expected to fail,
> while copen itself shall succeed. However, returning 0 is indeed
> unexpected when cache_size is an invalid error code.
> 
> Fix this by returning error when cache_size is an invalid error code.
> 
> Fixes: c8383054506c ("cachefiles: notify the user daemon when looking up cookie")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> Suggested-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v4: update the code suggested by Dan
> v3: update the commit log suggested by Jingbo.

Thanks!

regards,
dan carpenter

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

